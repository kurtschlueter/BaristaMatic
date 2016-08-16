class Drinks
  attr_accessor :drink_details, :ingredients

  def initialize
    # Initial drink recipe with number of ingredients needed to make each drink
    @drink_details = {
      "Coffee" => {"ingredients" =>
          {"Coffee" => 3, "Sugar" => 1, "Cream" => 1}},
      "Decaf Coffee" => {"ingredients" =>
          {"Decaf Coffee" => 3, "Sugar" => 1, "Cream" => 1}},
      "Caffe Latte" => {"ingredients" =>
          {"Espresso" => 2, "Steamed Milk" => 1}},
      "Caffe Americano" => {"ingredients" =>
          {"Espresso" => 3}},
      "Caffe Mocha" => {"ingredients" =>
          {"Espresso" => 1, "Cocoa" => 1, "Steamed Milk" => 1, "Whipped Cream" => 1}},
      "Cappuccino" => {"ingredients" =>
          {"Espresso" => 2, "Steamed Milk" => 1, "Foamed Milk" => 1}}
    }

    # Initial cost and stock of each ingredient
    @ingredients = {
      "Coffee" => {"price" => 0.75, "units left" => 10},
      "Decaf Coffee" => {"price" => 0.75, "units left" => 10},
      "Sugar" => {"price" => 0.25, "units left" => 10},
      "Cream" => {"price" => 0.25, "units left" => 10},
      "Steamed Milk" => {"price" => 0.35, "units left" => 10},
      "Foamed Milk" => {"price" => 0.35, "units left" => 10},
      "Espresso" => {"price" => 1.10, "units left" => 10},
      "Cocoa" => {"price" => 0.90, "units left" => 10},
      "Whipped Cream" => {"price" => 1.00, "units left" => 10}
    }

    set_drink_prices()
    register_all_availabilities()
  end

  # Calculate the price of all drinks
  def set_drink_prices
    @drink_details.each do |drink, details|
      total = 0
      details["ingredients"].each do |ingredient, units|
        total = total + @ingredients[ingredient]["price"] * units
      end
      details["unit price"] = '%.2f' % [total]
    end
  end

  # registers if all drinks are in stock or not
  def register_all_availabilities
    @drink_details.each do |drink, details|
      details["available?"] = true
      details["ingredients"].each do |ingredient, units|
        if units > @ingredients[ingredient]["units left"]
          details["available?"] = false
        end
      end
    end
  end

  # make an individual drink. not sure what this will return yet.
  def make_drink(drink)
    if @drink_details[drink]["available?"] == true
      @drink_details[drink]["ingredients"].each do |ingredient, units|
        @ingredients[ingredient]["units left"] = @ingredients[ingredient]["units left"] - units
      end
      register_all_availabilities()
      return [true, drink]
    else
      # prob dont need this next line
      register_all_availabilities()
      return [false, drink]
    end
  end

  # restocks all ingredients to maximum value (10)
  def restock
    ingredients.each do |ingredient, details|
      details["units left"] = 10
    end
    register_all_availabilities()
  end
end