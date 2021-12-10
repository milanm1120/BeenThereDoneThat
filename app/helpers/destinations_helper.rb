module DestinationsHelper

    def all_destinations_list(destinations)
        if @destinations.length == 0 
            No Destinations Yet
        else 
            @destinations.each do |d| 
                link_to d.city_country, destination_pins_path(d), class: "font_color"
            end 
        end
    end

    def individual_destination(destination)
        @destination.pins.each do |p|
             p.destination.city
        end
    end

end