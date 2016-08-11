def display_menu(items)
  print "Menu:"
  puts ''

  items.each_with_index do |item, index|
    print (index + 1).to_s + ',' + item[0] + ',$' + item[1] + ',' + item[2].to_s
    puts ''
  end
end

def display_inventory(items)
  print "Inventory:"
  puts ''

  items.each do |item|
    print item[0] + ',' + item[1]
    puts ''
  end
end