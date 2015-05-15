group1 = Group.create(name: 'triumph.admin')

user1 = User.create(name: 'armstrhb', active: true)
user2 = User.create(name: 'wallBMW', active: true)

user1.groups << group1
user2.groups << group1

realm1 = Realm.create(name: 'test.realm', active: true, group: group1)
realm2 = Realm.create(name: 'secondary.realm', active: true, group: group1)

realm1.users << user1
realm1.users << user2

rarity1 = Rarity.create(name: 'bronze', realm: realm1)
rarity2 = Rarity.create(name: 'silver', realm: realm1)
rarity3 = Rarity.create(name: 'gold', realm: realm1)
rarity4 = Rarity.create(name: 'platinum', realm: realm1)

category1 = Category.create(name: 'general', realm: realm1)
category2 = Category.create(name: 'special', realm: realm1)

achievement1 = Achievement.create(title: 'A Winner is You!', description: 'You did it! First Achievement.', repeatable: false, points: 5, required_ticks: 1, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
