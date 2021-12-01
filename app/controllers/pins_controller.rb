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
        @pin = Pin.new
        # if params[:destination_id]
        #     @destination = Destination.find_by(params[:destination_id])
        #     @pin = @destination.pins.build
        # else
        #     @pin = Pin.new
        #     @pin.build_destination
        # end
    end

    def show
    end

    def create
        if !params[:pin][:destination_id].empty?
            destination_id = params[:pin][:destination_id]
            
        else
            destination = Destination.create!({
                city: params[:pin][:destination][:city],
                country: params[:pin][:destination][:country]
            })
            destination_id = destination.id 
        end

        @pin = Pin.new({
            user: current_user,
            rating: params[:pin][:rating],
            date: params[:pin][:date],
            destination_id: destination.id
        })

        if @pin.save 
            redirect_to pin_path(@pin)
        else
            redirect_to new_pin_path
        end
        # if params[:destination_id]
        #     @destination = Destination.find_by(params[:destination_id])
        #     @pin = @destination.pins.build(pin_params)
        # else
        #     @pin = Pin.new(pin_params)
        # end
        
        # if @pin.save
        #     redirect_to pin_path(@pin)
        # else
        #     render :new
        # end
    end

    def edit
    end

    def update
        @pin.update(pin_params)
        if @pin.valid?
            redirect_to pin_params(@pin)
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
        params.require(:pin).permit(:rating, :date, :user_id, :destination_id, destination: [:city, :country])
    end

    def find_pin
        @pin = Pin.find_by_id(params[:id])
    end
end