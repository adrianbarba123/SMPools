class PoolsController < ApplicationController
    def index
        render json: Pool.all, status: :ok
    end

    def show
        render json: Pool.find(params[:id]), status: :ok
    end

    def destroy
        Pool.find(params[:id]).destroy
        head :no_content
    end

    def create
        Pool.create!(pool_params)
        render json: pool, status: :created
    end

    private

    def pool_params
        params.permit(:address, :size, :saltwater, :user)
    end
end
