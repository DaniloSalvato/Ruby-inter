module Shippable
    SHIPPING_METER_COST = 0.0001
    AMOUNT_MULTIPLIER = 0.0003
    SERVICE_TAX = 1

    def calculate_shipping(quantity)
        distance = distance_between 
        distance_cost = distance[:meters] * SHIPPING_METER_COST
        quantity_cost = quantity * AMOUNT_MULTIPLIER

        distance_cost + quantity_cost + SERVICE_TAX
    end

    private

    def distance_between
        distance = rand(1..200)
        {km: distance, meters: distance * 1000}
    end 
end