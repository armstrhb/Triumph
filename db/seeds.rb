user1 = User.create(name: 'armstrhb', active: true, email: 'armstrhb@github.com', password: 'foobar', password_confirmation: 'foobar')
user2 = User.create(name: 'wallBMW', active: true, email: 'wallbmw@github.com', password: 'hnnngh', password_confirmation: 'hnnngh')
user3 = User.create(name: 'thirdPerson', active: true, email: 'fake@email.com', password: 'fakepass', password_confirmation: 'fakepass')

group1 = Group.create(name: 'triumph.admin', admin: user1)
group2 = Group.create(name: 'another.group', admin: user1)
group3 = Group.create(name: 'bootstrap.cool.guys', admin: user2)

user1.groups << group1
user2.groups << group1

SysConfig.create(key: 'triumph.admin.group', value: group1.id)

Icon.create(name: 'ambulance')
Icon.create(name: 'anchor')
Icon.create(name: 'android')
Icon.create(name: 'apple')
Icon.create(name: 'archive')
Icon.create(name: 'area-chart')
Icon.create(name: 'arrow-circle-down')
Icon.create(name: 'arrow-circle-left')
Icon.create(name: 'arrow-circle-right')
Icon.create(name: 'arrow-circle-up')
Icon.create(name: 'arrows')
Icon.create(name: 'asterisk')
Icon.create(name: 'at')
Icon.create(name: 'ban')
Icon.create(name: 'bar-chart')
Icon.create(name: 'barcode')
Icon.create(name: 'bars')
Icon.create(name: 'bed')
Icon.create(name: 'beer')
Icon.create(name: 'bell')
Icon.create(name: 'bell-o')
Icon.create(name: 'bell-slash')
Icon.create(name: 'bell-slash-o')
Icon.create(name: 'bicycle')
Icon.create(name: 'binoculars')
Icon.create(name: 'birthday-cake')
Icon.create(name: 'bolt')
Icon.create(name: 'bomb')
Icon.create(name: 'book')
Icon.create(name: 'bookmark')
Icon.create(name: 'bookmark-o')
Icon.create(name: 'briefcase')
Icon.create(name: 'bug')
Icon.create(name: 'building')
Icon.create(name: 'building-o')
Icon.create(name: 'bullhorn')
Icon.create(name: 'bullseye')
Icon.create(name: 'bus')
Icon.create(name: 'calculator')
Icon.create(name: 'calendar')
Icon.create(name: 'calendar-o')
Icon.create(name: 'camera')
Icon.create(name: 'camera-retro')
Icon.create(name: 'car')
Icon.create(name: 'certificate')
Icon.create(name: 'chain')
Icon.create(name: 'chain-broken')
Icon.create(name: 'check')
Icon.create(name: 'check-circle')
Icon.create(name: 'check-circle-o')
Icon.create(name: 'check-square')
Icon.create(name: 'check-square-o')
Icon.create(name: 'child')
Icon.create(name: 'circle')
Icon.create(name: 'circle-o')
Icon.create(name: 'circle-o-notch')
Icon.create(name: 'circle-thin')
Icon.create(name: 'clipboard')
Icon.create(name: 'clock-o')
Icon.create(name: 'cloud')
Icon.create(name: 'cloud-download')
Icon.create(name: 'cloud-upload')
Icon.create(name: 'cny')
code_icon = Icon.create(name: 'code')
code_fork_icon = Icon.create(name: 'code-fork')
Icon.create(name: 'codepen')
Icon.create(name: 'coffee')
Icon.create(name: 'cog')
Icon.create(name: 'cogs')
Icon.create(name: 'columns')
Icon.create(name: 'comment')
Icon.create(name: 'comment-o')
Icon.create(name: 'comments')
Icon.create(name: 'comments-o')
Icon.create(name: 'compass')
Icon.create(name: 'copyright')
Icon.create(name: 'credit-card')
Icon.create(name: 'crop')
Icon.create(name: 'crosshairs')
Icon.create(name: 'css3')
Icon.create(name: 'cube')
Icon.create(name: 'cubes')
Icon.create(name: 'cutlery')
Icon.create(name: 'database')
Icon.create(name: 'desktop')
Icon.create(name: 'diamond')
Icon.create(name: 'dot-circle-o')
Icon.create(name: 'download')
Icon.create(name: 'dropbox')
Icon.create(name: 'empire')
Icon.create(name: 'envelope')
Icon.create(name: 'envelope-o')
Icon.create(name: 'eraser')
Icon.create(name: 'eur')
Icon.create(name: 'exchange')
Icon.create(name: 'exclamation')
Icon.create(name: 'exclamation-circle')
Icon.create(name: 'exclamation-triangle')
Icon.create(name: 'eye')
Icon.create(name: 'eye-slash')
Icon.create(name: 'eyedropper')
Icon.create(name: 'facebook')
Icon.create(name: 'facebook-official')
Icon.create(name: 'fax')
Icon.create(name: 'female')
Icon.create(name: 'fighter-jet')
Icon.create(name: 'film')
Icon.create(name: 'filter')
Icon.create(name: 'fire')
Icon.create(name: 'fire-extinguisher')
Icon.create(name: 'flag')
Icon.create(name: 'flag-checkered')
Icon.create(name: 'flag-o')
Icon.create(name: 'flask')
Icon.create(name: 'floppy-o')
Icon.create(name: 'folder')
Icon.create(name: 'folder-open')
Icon.create(name: 'frown-o')
Icon.create(name: 'futbol-o')
Icon.create(name: 'gamepad')
Icon.create(name: 'gavel')
Icon.create(name: 'gbp')
Icon.create(name: 'gift')
Icon.create(name: 'git')
Icon.create(name: 'github')
Icon.create(name: 'github-alt')
Icon.create(name: 'glass')
Icon.create(name: 'globe')
Icon.create(name: 'google')
Icon.create(name: 'graduation-cap')
Icon.create(name: 'hdd-o')
Icon.create(name: 'headphones')
Icon.create(name: 'heart')
Icon.create(name: 'heartbeat')
Icon.create(name: 'history')
Icon.create(name: 'home')
Icon.create(name: 'hospital-o')
Icon.create(name: 'html5')
Icon.create(name: 'ils')
Icon.create(name: 'inbox')
Icon.create(name: 'info')
Icon.create(name: 'inr')
Icon.create(name: 'instagram')
Icon.create(name: 'jpy')
Icon.create(name: 'key')
Icon.create(name: 'keyboard-o')
Icon.create(name: 'krw')
Icon.create(name: 'language')
Icon.create(name: 'laptop')
Icon.create(name: 'leaf')
Icon.create(name: 'lemon-o')
Icon.create(name: 'life-ring')
Icon.create(name: 'lightbulb-o')
Icon.create(name: 'line-chart')
Icon.create(name: 'linkedin')
Icon.create(name: 'linux')
Icon.create(name: 'list')
Icon.create(name: 'list-al')
Icon.create(name: 'location-arrow')
Icon.create(name: 'lock')
Icon.create(name: 'magic')
Icon.create(name: 'magnet')
Icon.create(name: 'male')
Icon.create(name: 'map-marker')
Icon.create(name: 'medkit')
Icon.create(name: 'meh-o')
Icon.create(name: 'microphone')
Icon.create(name: 'microphone-slash')
Icon.create(name: 'minux')
Icon.create(name: 'mobile')
Icon.create(name: 'money')
Icon.create(name: 'moon-o')
Icon.create(name: 'motorcycle')
Icon.create(name: 'music')
Icon.create(name: 'newspaper-o')
Icon.create(name: 'paint-brush')
Icon.create(name: 'paper-plane')
Icon.create(name: 'paperclip')
Icon.create(name: 'paragraph')
Icon.create(name: 'paw')
Icon.create(name: 'pencil')
Icon.create(name: 'phone')
Icon.create(name: 'picture-o')
Icon.create(name: 'pie-chart')
plane_icon = Icon.create(name: 'plane')
Icon.create(name: 'plug')
Icon.create(name: 'plus')
Icon.create(name: 'power-off')
Icon.create(name: 'print')
Icon.create(name: 'puzzle-piece')
Icon.create(name: 'qq')
Icon.create(name: 'qrcode')
Icon.create(name: 'question')
Icon.create(name: 'quote-left')
Icon.create(name: 'quote-right')
Icon.create(name: 'random')
Icon.create(name: 'rebel')
Icon.create(name: 'recycle')
Icon.create(name: 'reddit')
Icon.create(name: 'refresh')
Icon.create(name: 'repeat')
Icon.create(name: 'reply')
Icon.create(name: 'reply-all')
Icon.create(name: 'retweet')
Icon.create(name: 'road')
rocket_icon = Icon.create(name: 'rocket')
Icon.create(name: 'rss')
Icon.create(name: 'rub')
Icon.create(name: 'scissors')
Icon.create(name: 'search')
Icon.create(name: 'server')
Icon.create(name: 'share')
Icon.create(name: 'share-alt')
Icon.create(name: 'shekel')
Icon.create(name: 'shield')
Icon.create(name: 'ship')
Icon.create(name: 'shopping-cart')
Icon.create(name: 'sign-in')
Icon.create(name: 'sign-out')
Icon.create(name: 'signal')
Icon.create(name: 'sitemap')
Icon.create(name: 'slack')
Icon.create(name: 'sliders')
Icon.create(name: 'smile-o')
Icon.create(name: 'sort')
Icon.create(name: 'space-shuttle')
Icon.create(name: 'spinner')
Icon.create(name: 'spoon')
Icon.create(name: 'spotify')
Icon.create(name: 'square')
Icon.create(name: 'square-o')
Icon.create(name: 'stack-exchange')
Icon.create(name: 'stack-overflow')
Icon.create(name: 'star')
Icon.create(name: 'star-half')
Icon.create(name: 'star-half-o')
Icon.create(name: 'star-o')
Icon.create(name: 'steam')
Icon.create(name: 'stethoscope')
Icon.create(name: 'street-view')
Icon.create(name: 'suitcase')
Icon.create(name: 'sun-o')
Icon.create(name: 'superscript')
Icon.create(name: 'table')
Icon.create(name: 'tablet')
Icon.create(name: 'tachometer')
Icon.create(name: 'tag')
Icon.create(name: 'tags')
Icon.create(name: 'tasks')
Icon.create(name: 'taxi')
Icon.create(name: 'terminal')
Icon.create(name: 'th')
Icon.create(name: 'th-large')
Icon.create(name: 'th-list')
Icon.create(name: 'thumb-tack')
Icon.create(name: 'thumbs-down')
Icon.create(name: 'thumbs-o-down')
Icon.create(name: 'thumbs-o-up')
Icon.create(name: 'thumbs-up')
Icon.create(name: 'ticket')
Icon.create(name: 'times')
Icon.create(name: 'tint')
Icon.create(name: 'toggle-off')
Icon.create(name: 'toggle-on')
Icon.create(name: 'trash')
Icon.create(name: 'trash-o')
Icon.create(name: 'tree')
trophy_icon = Icon.create(name: 'trophy')
Icon.create(name: 'truck')
Icon.create(name: 'try')
Icon.create(name: 'tty')
Icon.create(name: 'tumblr')
Icon.create(name: 'twitch')
Icon.create(name: 'twitter')
Icon.create(name: 'umbrella')
Icon.create(name: 'undo')
Icon.create(name: 'university')
Icon.create(name: 'unlock')
Icon.create(name: 'unlock-alt')
Icon.create(name: 'upload')
Icon.create(name: 'usd')
Icon.create(name: 'user')
Icon.create(name: 'user-md')
Icon.create(name: 'user-plus')
Icon.create(name: 'user-secret')
Icon.create(name: 'user-times')
Icon.create(name: 'users')
Icon.create(name: 'video-camera')
Icon.create(name: 'vine')
Icon.create(name: 'volume-down')
Icon.create(name: 'volume-off')
Icon.create(name: 'volume-up')
Icon.create(name: 'weibo')
Icon.create(name: 'wheelchair')
Icon.create(name: 'wifi')
Icon.create(name: 'windows')
Icon.create(name: 'wrench')
Icon.create(name: 'yahoo')
Icon.create(name: 'youtube')

realm1 = Realm.create(name: 'test.realm', active: true, group: group1, color: "#3498db", icon: code_icon)
realm2 = Realm.create(name: 'secondary.realm', active: true, group: group1, color: "#27ae60", icon: code_fork_icon)

realm1.users << user1
realm1.users << user2

rarity1 = Rarity.create(name: 'bronze', realm: realm1, description: 'Base line achievements.', icon: trophy_icon, color: '#e87e04', rareness: 1)
rarity2 = Rarity.create(name: 'silver', realm: realm1, description: 'A little less common.', icon: trophy_icon, color: '#95a5a6', rareness: 2)
rarity3 = Rarity.create(name: 'gold', realm: realm1, description: 'These are tough to get.', icon: trophy_icon, color: '#f5ab35', rareness: 3)
rarity4 = Rarity.create(name: 'platinum', realm: realm1, description: 'Good luck. These are rare!', icon: trophy_icon, color: '#abb7b7', rareness: 4)

category1 = Category.create(name: 'general', description: 'some of that basic stuff', realm: realm1, icon: plane_icon, color: '#6c7a89')
category2 = Category.create(name: 'special', description: 'some of that wizard stuff', realm: realm1, icon: rocket_icon, color: '#297acc')

achievement1 = Achievement.create(title: 'A Winner is You!', description: 'You did it! First Achievement.', repeatable: false, points: 5, required_ticks: 1, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
achievement2 = Achievement.create(title: 'Figured out how to link to from index', description: 'Pro Rails Yo.', repeatable: false, points: 7, required_ticks: 1, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
achievement3 = Achievement.create(title: 'Sweet Bootstrap Skills', description: 'Show off those sick grid skills on one page in Triumph.', repeatable: false, points: 5, required_ticks: 1, realm: realm1, category: category1, rarity: rarity2, active_start: DateTime.new(2015,5,1), active_end: DateTime.new(2016,5,1))
achievement4 = Achievement.create(title: 'There Be Progress!', description: 'Get a Bootstrap progress bar to show up on the achievement detail screen.', repeatable: false, points: 5, required_ticks: 5, realm: realm1, category: category1, rarity: rarity1, active_start: DateTime.new(2015,5,20), active_end: DateTime.new(2016,5,20))

progress1 = Progress.create(achievement: achievement1, user: user1, ticks: 0, completed: false)
progress2 = Progress.create(achievement: achievement1, user: user2, ticks: 1, completed: true, complete_date: DateTime.new(2015,5,15,16,45))
progress3 = Progress.create(achievement: achievement2, user: user1, ticks: 1, completed: true, complete_date: DateTime.new(2015,5,16,22,01))
progress4 = Progress.create(achievement: achievement3, user: user2, ticks: 1, completed: true, complete_date: DateTime.new(2015,5,14,14,12))
progress5 = Progress.create(achievement: achievement4, user: user1, ticks: 1, completed: false)
