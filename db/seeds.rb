# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Ad.create(ad_bar_id: 1, title: "Ad 1", url: "https://upload.wikimedia.org/wikipedia/commons/f/f5/Howlsnow.jpg" )
# Ad.create(ad_bar_id: 2, title: "Ad 2", url: "http://animals.sandiegozoo.org/sites/default/files/juicebox_slides/rocky_mountains_gray_wolf.jpg" )
