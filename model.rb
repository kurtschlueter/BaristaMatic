class Drinks
  attr_accessor :drink_details, :ingredients

  def initialize
    # Initial drink recipe with number of ingredients needed to make each drink
    @drink_details = {
      "Coffee" => {"ingredients" =>
          {"coffee" => 3, "sugar" => 1, "cream" => 1}},
      "Decaf Coffee" => {"ingredients" =>
          {"decaf coffee" => 3, "sugar" => 1, "cream" => 1}},
      "Caffe Latte" => {"ingredients" =>
          {"espresso" => 2, "steamed milk" => 1}},
      "Caffe Americano" => {"ingredients" =>
          {"espresso" => 3}},
      "Caffe Mocha" => {"ingredients" =>
          {"espresso" => 1, "cocoa" => 1, "steamed milk" => 1, "whipped cream" => 1}},
      "Cappuccino" => {"ingredients" =>
          {"espresso" => 2, "steamed milk" => 1, "foamed milk" => 1}}
    }

    # Initial cost and stock of each ingredient
    @ingredients = {
      "coffee" => {"price" => 0.75, "units left" => 10},
      "decaf coffee" => {"price" => 0.75, "units left" => 10},
      "sugar" => {"price" => 0.25, "units left" => 10},
      "cream" => {"price" => 0.25, "units left" => 10},
      "steamed milk" => {"price" => 0.35, "units left" => 10},
      "foamed milk" => {"price" => 0.35, "units left" => 10},
      "espresso" => {"price" => 1.10, "units left" => 10},
      "cocoa" => {"price" => 0.90, "units left" => 10},
      "whipped cream" => {"price" => 1.00, "units left" => 10}
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