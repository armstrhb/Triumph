group1 = Group.create(name: 'triumph.admin')

user1 = User.create(name: 'armstrhb', active: true)
user2 = User.create(name: 'wallBMW', active: true)

user1.groups << group1
user2.groups << group1

realm1 = Realm.create(name: 'test.realm', active: true, group: group1)

rarity1 = Rarity.create(name: 'bronze')
rarity2 = Rarity.create(name: 'silver')
rarity3 = Rarity.create(name: 'gold')
rarity4 = Rarity.create(name: 'platinum')

category1 = Category.create(name: 'general')
category2 = Category.create(name: 'special')

achievement1 = Achievement.create(title: 'A Winner is You!', description: 'You did it! First Achievement.', repeatable: false, points: 5, required_ticks: 1, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
