class PinsController < ApplicationController

    def index
        @pins = Pin.all
    end

    def new     #render a new form
        @pin = Pin.new
    end

    def show

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

    end

    def update

    end

    def destroy

    end

    private
    def pin_params      #strong params which permits fields being created
        params.require(:pin).permit(:rating, :date, :user_id, :destination_id)
    end


end
