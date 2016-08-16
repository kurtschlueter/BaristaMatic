require_relative 'model'
require_relative 'view'

drinks = Drinks.new
display = Display.new

# # maybe move sort from view so it does it just once instead of everytime a view is rendered

command = 'init'
drink_options = ["Caffe Americano", "Caffe Latte", "Caffe Mocha", "Cappuccino", "Coffee", "Decaf Coffee"]

while command != 'q'
  if command == 'init'
    display.inventory(drinks.ingredients)
    display.menu(drinks.drink_details)
  elsif command == 'r'
    drinks.restock()
    display.inventory(drinks.ingredients)
    display.menu(drinks.drink_details)

  elsif command.to_i >=1 && command.to_i <=6
    drink_order = drinks.make_drink(drink_options[command.to_i - 1]) #model
    display.order(drink_order)
    display.inventory(drinks.ingredients)
    display.menu(drinks.drink_details)

  elsif command == 'q'
    break
  else
    if command != ''
      display.invalid_selection(command)
    end
  end
  command = ARGF.getc.chomp
  command = command.downcase
end