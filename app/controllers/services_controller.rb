class ServicesController < ApplicationController
    def index
        render json: Service.all, status: :ok
    end

    def show
        render json: Service.find(params[:id]), status: :ok
    end

    def destroy
        Service.find(params[:id]).destroy
        head :no_content
    end
end
