require 'test_helper'

class RealmTest < ActiveSupport::TestCase
  test "realm initial test" do
    Realm.all.each { |r|
      assert_not r == nil, "realm is nil"
      assert_not r.name.empty?, "realm name is empty"
      assert_not r.group == nil, "admin group is nil"
    }
  end

  test "realm save within name" do
    realm = Realm.new
    assert_not realm.save, "saved realm without a name"
  end

  test "realm create" do
    realm = Realm.new
    realm.name = "test-realm"
    realm.active = false

    group = Group.new
    group.name = "test-realm-admins"

    realm.group = group
    assert realm.save, "save realm failed"
  end

  test "realm change group" do
    realm = Realm.new
    realm.name = "test-realm2"
    realm.active = false

    group = Group.new
    group.name = "test-realm2-admins"

    realm.group = group
    realm.save

    group1 = Group.new
    group1.name = "the-replacement-group"

    realm.group = group1
    realm.save

    realm_check = Realm.find_by(name: realm.name)
    assert realm_check.group.name == realm.group.name, "group change didn't commit"
  end
end
