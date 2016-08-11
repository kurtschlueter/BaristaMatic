require_relative 'model'
require_relative 'view'

drinks = Drinks.new

# This will have to get cleaned up and organized but I am just building for functionality now


def formatting_inventory_for_print(drinks)
  inventory = []
  drinks.ingredients.each do |ingredient, details|
    inventory << [ingredient, details["units_left"].to_s]
  end
  inventory = inventory.sort {|a,b| a[0] <=> b[0]}
end

def formatting_menu_for_print(drinks)
  menu = []
  drinks.drink_recipes.each do |drink, ingredients|
    menu << [drink, drinks.drink_price(drink), drinks.can_make_drink?(drink)]
  end
  menu = menu.sort {|a,b| a[0] <=> b[0]}
end

formatted_inventory = formatting_inventory_for_print(drinks) #controller
display_inventory(formatted_inventory) #view
formatted_menu = formatting_menu_for_print(drinks) #controller
display_menu(formatted_menu) #view

drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
display_order(drink_order) #view

formatted_inventory = formatting_inventory_for_print(drinks) #controller
display_inventory(formatted_inventory) #view
formatted_menu = formatting_menu_for_print(drinks) #controller
display_menu(formatted_menu) #view


