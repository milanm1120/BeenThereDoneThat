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
        @pin = current_user.pins.build(pin_params)
        if @pin.save
            redirect_to pins_path
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
