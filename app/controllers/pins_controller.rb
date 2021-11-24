class PinsController < ApplicationController

    def index
        @pins = Pin.all
    end

    def new     #render a new form
        @pin = Pin.new
        @pin.build_destination
    end

    def show
        find_pin
    end

    def create
        @pin = Pin.new(pin_params)
        if @pin.save
            redirect_to pin_path(@pin)
        else
            render :new
        end
    end

    def edit
        find_pin
    end

    def update
        find_pin
        @pin.update(params[:pin])
    end

    def destroy
        find_pin
        @pin.destroy
            redirect_to pins_path
    end

    private
    def pin_params      #strong params which permits fields being created
        params.require(:pin).permit(:rating, :date, :user_id, :destination_id, destination_attributes: [:city, :country])
    end

    def find_pin
        @pin = Pin.find_by_id(params[:id])
    end


end
