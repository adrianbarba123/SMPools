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

    def create
        Service.create!(service_params)
        render json: service, status: :created
    end

    private

    def service_params
        params.permit(:cleaning, :chemical_balance, :quote)
    end
end
