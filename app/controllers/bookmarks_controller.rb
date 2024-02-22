class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(permit)
    if @bookmark.save
      redirect_to list_path(@bookmark[:list_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def permit
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
