class PoolsController < ApplicationController
    def index
        render json: Pool.all, status: :ok
    end
end
