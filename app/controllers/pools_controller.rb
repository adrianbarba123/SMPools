class PoolsController < ApplicationController
    before_action :set_pool
    before_action :set_user

    # def index
    #     render json: Pool.all, status: :ok
    # end

    def index
        @pools = @user.pools
    
        render json: @pools
    end

    def show
        render json: Pool.find(params[:id]), status: :ok
    end

    def destroy
        Pool.find(params[:id]).destroy
        head :no_content
    end

    def create
        pool = Pool.new(pool_params)
        pool.user = @user
        
        if pool.save
          render json: pool, status: :created
        else
          render json: { message: "Failed to create pool" }, status: :unprocessable_entity
        end
      end

    private

    def set_pool
        @pool = Pool.find(params[:id])
    end
    
      def set_user
        @user = User.find(params[:user_id])
    end

    def pool_params
        params.permit(:address, :size, :saltwater, :user_id)
    end
end
