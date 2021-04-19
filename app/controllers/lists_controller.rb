class ListsController < ApplicationController
    def index
        lists = List.all 
        render json: lists 
    end

    def show
        list = List.find(params[:id])
        render json: list
    end

    def create
       list = List.new(list_params)
       if list.save 
        render json:list
       else
        render json: {error: "The list couldn't be created.Please try again"}
       end
    end

    def edit
       list = List.find(params[:id])
    end

    def update
        list = List.find(params[:id])
        if list.update(list_params)
            render json: list
        else
            render json: {error: "200"}
        end
    end

    def destroy
        list = List.find(params[:id])
        list.destroy(
            render json: {message: "The list was succesfully deleted."}
        )
    end

    private

    def list_params
        params.require(:list).permit(:name, :status)
       
    end
end
