class DestinationsController < ApplicationController
    before_action :find_destination, except: [:index, :new, :create]

    def index
        @destinations = Destination.order_by_country           #order_by_country is a scope method defined in models/estination.rb
    end

    def new     #render a new form
        @destination = Destination.new
        @destination.pins.build
    end

    def show
        @destination = Destination.find_by(id: params[:id])
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to destination_path(@destination)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @destination.update(params[:destination])
    end

    def destroy
        @destination.destroy
            redirect_to destinations_path
    end

    private
    def destination_params      #strong params which permits fields being created
        params.require(:destination).permit(:city, :country, pins_attributes: [:rating, :date])
    end

    def find_destination
        @destination = Destination.find_by(params[:destination_id])
    end

end
