class Display
  def menu(items)
    print "Menu:"
    puts ''
    items.each_with_index do |item, index|
      print (index + 1).to_s + ',' + item[0] + ',$' + item[1] + ',' + item[2].to_s
      puts ''
    end
  end

  def inventory(items)
    print "Inventory:"
    puts ''
    items.each do |item|
      print item[0] + ',' + item[1]
      puts ''
    end
  end

  def order(item)
    if item[0] == true
      print "Dispensing: " + item[1]
      puts ''
    else
      print "Out of Stock: " + item[1]
      puts ''
    end
  end

  def invalid_selection(characters)
      print "Invalid Selection: " + characters
      puts ''
  end
end