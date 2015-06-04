group1 = Group.create(name: 'triumph.admin')
group2 = Group.create(name: 'another.group')
group3 = Group.create(name: 'bootstrap.cool.guys')

user1 = User.create(name: 'armstrhb', active: true, email: 'armstrhb@github.com', password: 'foobar', password_confirmation: 'foobar')
user2 = User.create(name: 'wallBMW', active: true, email: 'wallbmw@github.com', password: 'hnnngh', password_confirmation: 'hnnngh')

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

category1 = Category.create(name: 'general', description: 'some of that basic stuff', realm: realm1)
category2 = Category.create(name: 'special', description: 'some of that wizard stuff', realm: realm1)

achievement1 = Achievement.create(title: 'A Winner is You!', description: 'You did it! First Achievement.', repeatable: false, points: 5, required_ticks: 1, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
achievement2 = Achievement.create(title: 'Figured out how to link to from index', description: 'Pro Rails Yo.', repeatable: false, points: 7, required_ticks: 1, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
achievement3 = Achievement.create(title: 'Sweet Bootstrap Skills', description: 'Show off those sick grid skills on one page in Triumph.', repeatable: false, points: 5, required_ticks: 1, realm: realm1, category: category1, rarity: rarity2, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
achievement4 = Achievement.create(title: 'There Be Progress!', description: 'Get a Bootstrap progress bar to show up on the achievement detail screen.', repeatable: false, points: 5, required_ticks: 5, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,20), active_end: DateTime.new(2016,5,20))

progress1 = Progress.create(achievement: achievement1, user: user1, ticks: 0, completed: false)
progress2 = Progress.create(achievement: achievement1, user: user2, ticks: 1, completed: true, complete_date: DateTime.new(2015,5,15,16,45))
progress3 = Progress.create(achievement: achievement2, user: user1, ticks: 1, completed: true, complete_date: DateTime.new(2015,5,16,22,01))
progress4 = Progress.create(achievement: achievement3, user: user2, ticks: 1, completed: true, complete_date: DateTime.new(2015,5,14,14,12))
progress5 = Progress.create(achievement: achievement4, user: user1, ticks: 1, completed: false)
