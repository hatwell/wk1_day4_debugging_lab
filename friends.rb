def get_name(person)
  return person[:name]
end

def get_tv_show(person)
  return person[:favourites][:tv_show]
end

def food_check(person, food)
  for item in person[:favourites][:things_to_eat]
    if item == food
      return true
    end
  end
  return false
end

def add_friend(person, pal)
  person[:friends].push(pal)
  return person[:friends].length
end

def remove_friend(person, former_friend)
  person[:friends].delete(former_friend)
  return person[:friends].length
end

def total_money(people)
  total = 0
  for person in people
    total += person[:monies]
  end
  return total
end

def loan_money(lender, borrower, amount)
  lender[:monies] -=amount.to_i
  borrower[:monies] +=amount.to_i
  confirmation_message = "After lending #{amount}, #{lender[:name]} has #{lender[:monies]} monies and #{borrower[:name]} has #{borrower[:monies]} monies."
  return confirmation_message
end

def list_foods(people)
  food_list = []
  for person in people
    food_list.push(person[:favourites][:things_to_eat])
  end
  return food_list.flatten
end

def no_friends(people)
  lonely_people = []
  for person in people
    if person[:friends].length < 1
      lonely_people.push(person[:name])
    end
  end
  return lonely_people
end

def same_tv_show(people, show)
  tv_show_likers = []
  for person in people
    if person[:favourites][:tv_show] == show
      tv_show_likers.push(person[:name])
    end
  end
  return tv_show_likers
end
