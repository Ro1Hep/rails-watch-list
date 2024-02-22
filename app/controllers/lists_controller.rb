class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = find_list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(permit)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def permit
    params.require(:list).permit(:name)
  end

  def find_list
    List.find(params[:id])
  end
end
