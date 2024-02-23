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
    list = List.find(params[:list_id])
    @bookmark.list = list
    if @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = find_bookmark
    @bookmark.destroy
    # redirect_to list_path(params[:list_id])
  end

  private

  def permit
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end

  def find_bookmark
    Bookmark.find(params[:id])
  end
end
