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

    def create
        PoolService.create!(pool_service_params)
        render json: pool_service, status: :created
    end

    private

    def pool_service_params
        params.permit(:date, :service, :pool)
    end
end
