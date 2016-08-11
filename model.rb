class Drinks
  attr_accessor :drink_recipes, :ingredients

  def initialize
    # Initial drink recipe with number of ingredients needed to make each drink
    @drink_recipes = {
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
      "coffee" => {"price" => 0.75, "units_left" => 10},
      "decaf coffee" => {"price" => 0.75, "units_left" => 10},
      "sugar" => {"price" => 0.25, "units_left" => 10},
      "cream" => {"price" => 0.25, "units_left" => 10},
      "steamed milk" => {"price" => 0.35, "units_left" => 10},
      "foamed milk" => {"price" => 0.35, "units_left" => 10},
      "espresso" => {"price" => 1.10, "units_left" => 10},
      "cocoa" => {"price" => 0.90, "units_left" => 10},
      "whipped cream" => {"price" => 1.00, "units_left" => 10}
    }
  end

  # Calculate the price of an individual drink. Returns price in string format
  def drink_price(drink)
    total = 0
    @drink_recipes[drink]["ingredients"].each do |ingredient, units|
      total = total + @ingredients[ingredient]["price"] * units
    end
    return '%.2f' % [total]
    # return total.round(2)
  end

  # returns true or false if store has enough ingredients to make a drink.
  def can_make_drink?(drink)
    @drink_recipes[drink]["ingredients"].each do |ingredient, units|
      if units > @ingredients[ingredient]["units_left"]
        return false
      end
    end
    return true
  end

  # make an individual drink. not sure what this will return yet. Also, it doesn't make sense to loop through twice with this method and the can_make_drink method. Will refactor later.
  def make_drink(drink)
    if can_make_drink?(drink) == true
      @drink_recipes[drink]["ingredients"].each do |ingredient, units|
        @ingredients[ingredient]["units_left"] = @ingredients[ingredient]["units_left"] - units
      end
      return [true, drink]
    else
      return [false, drink]
    end
  end

  # restocks all ingredients to maximum value (10)
  def restock
    ingredients.each do |ingredient, details|
      ingredient["units_left"] = 10
    end
    return true
  end
end

