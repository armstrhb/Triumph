require 'test_helper'

class AchievementTest < ActiveSupport::TestCase
  test "list achievements" do
    assert Achievement.all.length > 0, "achievements list empty"
  end

  test "test individual achievements" do
    Achievement.all.each { |a|
      assert_not a == nil, "first achievement is null"
      assert_not a.title.empty?, "title is empty"
      assert_not a.description.empty?, "description is empty"
      assert_not a.realm == nil, "realm is null"
      assert_not a.category == nil, "category is null"
      assert_not a.rarity == nil, "rarity is null"
      assert a.points >= 0, "points value is negative"
      assert a.required_ticks >= 0, "required ticks value is negative"
    }
  end
end
