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
end
