module UsersHelper

    def user_pin_show
        if current_user.pins.empty? 
        puts "You Don't Have Any Pins Yet!" 
        else 
            current_user.pins.each do |pin| 
               pin.destination.city
            end 
        end 
    end

end
