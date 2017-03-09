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
