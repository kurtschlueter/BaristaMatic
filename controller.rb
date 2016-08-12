require_relative 'model'
require_relative 'view'

drinks = Drinks.new
display = Display.new

display.inventory(drinks.ingredients)
display.menu(drinks.drink_details)


drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
drink_order = drinks.make_drink('Caffe Latte') #model
# drink_order = drinks.make_drink('Caffe Latte') #model
# drink_order = drinks.make_drink('Caffe Latte') #model

display.order(drink_order)
display.inventory(drinks.ingredients)
display.menu(drinks.drink_details)

# drinks.restock
# display.inventory(drinks.ingredients)
# display.menu(drinks.drink_details)

