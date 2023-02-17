class PoolServicesController < ApplicationController
    def index
        render json: PoolService.all, status: :ok
    end
end
