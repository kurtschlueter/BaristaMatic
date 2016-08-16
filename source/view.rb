class Display

  def menu(items)
    items = items.sort {|a,b| a[0] <=> b[0]}
    print "Menu:"
    puts ''
    index = 1
    items.each do |item, details|
      print index.to_s + ',' + item + ',$' + details["unit price"] + ',' + details["available?"].to_s
      puts ''
      index = index + 1
    end
  end

  def inventory(items)
    items = items.sort {|a,b| a[0] <=> b[0]}
    print "Inventory:"
    puts ''
    items.each do |item, details|
      print item + ',' + details["units left"].to_s
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