  def divide_by_four_or_seven_or_both(element)
    if (element%28==0)
      return "marcopolo"
    elsif (element%4==0)
      return "marco"
    elsif (element%7 == 0)
      return "polo"
    
    else
      return element
    end      
  end
  def print_marco
    (1..100).map{|item| divide_by_four_or_seven_or_both(item)}
  end