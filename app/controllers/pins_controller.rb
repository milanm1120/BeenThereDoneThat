class PinsController < ApplicationController

    def index
        @pins = Pin.all
    end

    def new     #render a new form
        @pin = Pin.new
        @pin.build_destination
    end

    def show
        @pin = Pin.find_by_id(params[:id])
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
        @pin = Pin.find_by_id(params[:id])
    end

    def update
        @pin = Pin.find_by_id(params[:id])
        @pin.update(params[:pin])
    end

    def destroy
        @pin = Pin.find_by_id(params[:id])
        @pin.destroy
            redirect_to pins_path
    end

    private
    def pin_params      #strong params which permits fields being created
        params.require(:pin).permit(:rating, :date, :user_id, :destination_id, destination_attributes: [:city, :country])
    end


end
