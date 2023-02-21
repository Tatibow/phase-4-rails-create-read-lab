class PlantsController < ApplicationController

    def index
        plants = Plant.all
        render json: plants, status: :ok
    end

    def show
        plant = Plant.find(params[:id])
        if(plant)
            render json: plant
        else
            render json: {error: "plant not found"}, status: :not_found
        end
    end

    def create
     newPlant = Plant.create(plant_params)
        render json: newPlant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
