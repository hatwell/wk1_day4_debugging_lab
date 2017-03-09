require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Dave", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Baywatch",
        things_to_eat: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      }
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Dave"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      }
    }

    @person5 = {
      name: "Dave",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_getting_name
    result = get_name(@person5)
    assert_equal("Dave", result)
  end

  # 1. For a given person, return their favourite tv show
  def test_getting_tv_show
    expected_result = "Baywatch"
    actual_result = get_tv_show(@person2)
    assert_equal(expected_result, actual_result)
    expected_result2 = "Scrubs"
    actual_result2 = get_tv_show(@person5)
    assert_equal(expected_result2, actual_result2)
  end

  # 2. For a given person, check if they like a particular food
  def test_do_they_like_the_food
    expected_result =  true
    actual_result = food_check(@person1, "charcuterie")
    expected_result2 = false
    actual_result2 = food_check(@person2, "seitan")

    assert_equal(expected_result, actual_result)
    assert_equal(expected_result2, actual_result2)
  end

  # 3. Allow a new friend to be added to a given person
  def test_add_friend
    expected_result = @person2[:friends].length() + 1
    actual_result = add_friend(@person2, "Øl")
    assert_equal(expected_result, actual_result)
  end

  # 4. Allow a friend to be removed from a given person

  def test_remove_friend
    expected_result = @person4[:friends].length() -1
    actual_result = remove_friend(@person4, "Jay")
    assert_equal(expected_result, actual_result)
  end
  # 5. Find the total of everyone's money
  def test_find_total
    expected_result = 143
    actual_result = total_money(@people)
    assert_equal(expected_result, actual_result)
  end


  # 6. For two given people, allow the first person to loan a given value of money to the other
    def test_loan_function_returns_string
      expected_result = "After lending 5, Val has 15 monies and Jay has 7 monies."
      actual_result = loan_money(@person3, @person2, 5)
      assert_equal(expected_result, actual_result)
    end



  # 7. Find the set of everyone's favourite food joined together
  def test_list_of_foods
    expected_result = ["charcuterie", "soup", "bread", "ratatouille", "stew", "spaghetti", "spinach"]
    actual_result = list_foods(@people)
    assert_equal(expected_result, actual_result)
  end

  # 8. Find people with no friends

  def test_no_friends
    expected_result = ["Dave"]
    actual_result = no_friends(@people)
    assert_equal(expected_result, actual_result)
  end

  # VERY tough
  # Find the people who have the same favourite tv show
  def test_same_tv_show
    expected_result = ["Val", "Keith"]
    actual_result = same_tv_show(@people)
    assert_equal(expected_result, actual_result)
  end


end
