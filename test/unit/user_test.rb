require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users, :tweets

  test "basic user" do
    user = User.find(1)
    assert_equal user.id, 1
    assert_equal user.screen_name, 'taiki45'
  end
end
