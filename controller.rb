require_relative 'model'
require_relative 'view'

barista_matic = BaristaMatic.new

# This will have to get cleaned up and organized but I am just building for functionality now


def formatting_for_print(barista_matic)
  inventory = []

  barista_matic.ingredients.each do |ingredient, details|
    inventory << [ingredient, details["units_left"].to_s]
  end

  inventory = inventory.sort {|a,b| a[0] <=> b[0]}
  display_inventory(inventory)



  menu = []

  barista_matic.drink_recipes.each do |drink, ingredients|
    menu << [drink, barista_matic.drink_price(drink), barista_matic.can_make_drink?(drink)]
  end

  menu = menu.sort {|a,b| a[0] <=> b[0]}
  display_menu(menu)
end

formatting_for_print(barista_matic)
barista_matic.make_drink('Caffe Latte')
formatting_for_print(barista_matic)


