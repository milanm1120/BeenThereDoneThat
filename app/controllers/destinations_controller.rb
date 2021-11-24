class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def new     #render a new form
        @destination = Destination.new
        @destination.pins.build
    end

    def show
        @destination = Destination.find_by_id(params[:id])
    end

    def create
        @destination = Destination.new(destination_params)
        if @pin.save
            redirect_to destination_path(@destination)
        else
            render :new
        end
    end

    def edit
        @destination = Destination.find_by_id(params[:id])
    end

    def update
        @destination = Destination.find_by_id(params[:id])
        @destination.update(params[:destination])
    end

    def destroy
        @destination = Destination.find_by_id(params[:id])
        @destination.destroy
            redirect_to destinations_path
    end

    private
    def destination_params      #strong params which permits fields being created
        params.require(:destination).permit(:city, :country)
    end

end
