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
        @pin = Pin.new                              #.build helps buidling associated objects
        @pin.build_destination
    end

    def show
        @comment = Comment.new
    end

    def create
        @pin = current_user.pins.build(pin_params)
        byebug
        if @pin.save
                redirect_to user_path(current_user, @pin)
        else
                redirect_to new_pin_path
        end
    end

    def edit
    end

    def update
        @pin.update(pin_params)
        if @pin.save
            redirect_to pin_path(@pin)
        else
            render :edit
        end
    end

    def destroy
        @pin.destroy
            redirect_to current_user
    end

    private
    def pin_params      #strong params which permits fields being created
        params.require(:pin).permit(:rating, :date, :user_id, :destination_id, destination_attributes: [:city, :country])
    end

    def find_pin
        @pin = Pin.find_by_id(params[:id])
    end
end