class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def create
    list = List.new(list_params)
    if list.save
      render json: list
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    render json: list
  end

  private

  def list_params
    params.require(:list).permit(:title, :content)
  end
end
