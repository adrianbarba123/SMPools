class PoolServicesController < ApplicationController
    def index
        render json: PoolService.all, status: :ok
    end

    def show
        render json: PoolService.find(params[:id]), status: :ok
    end

    def destroy
        PoolService.find(params[:id]).destroy
        head :no_content
    end
end
