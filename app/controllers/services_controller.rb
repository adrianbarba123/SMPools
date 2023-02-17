class ServicesController < ApplicationController
    def index
        render json: Service.all, status: :ok
    end
end
