class PinsController < ApplicationController
    before_action :find_pin, except: [:index, :new, :create]

    def index
        if params[:destination_id]
            @destination = Destination.find_by(params[:destination_id])
            @pins = @destination.pins
        else
            @pins = Pin.all
        end
    end

    def new     #render a new form
        if params[:destination_id]
            @destination = Destination.find_by(params[:destination_id])
            @pin = @destination.pins.build
        else
            @pin = Pin.new
            @pin.build_destination
        end
    end

    def show
    end

    def create
        if params[:destination_id]
            @destination = Destination.find_by(params[:destination_id])
            @pin = @destination.pins.build(pin_params)
        else
            @pin = Pin.new(pin_params)
        end
        
        if @pin.save
            redirect_to pin_path(@pin)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @pin.update(pin_params)
            redirect_to pin_params(@pin)
        else
            render :edit
        end
    end

    def destroy
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
