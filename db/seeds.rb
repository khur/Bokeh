# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Photo.destroy_all
Contest.destroy_all
User.destroy_all

# kanye = Band.create(name: "Kanye West")
User.create([
              {
                image: "no image",
                name: "Richard Luo",
                username: "rluo0506",
                email: "rluo0506@gmail.com",
                password: "123qwe",
                password_confirmation: '123qwe',
                admin: true
              },
              {
                image: "no image",
                name: "Doge Wow",
                username: "doge",
                email: "doge@wow.com",
                password: "123qwe",
                password_confirmation: '123qwe',
                admin: false
              }
])

Contest.create([
                 {
                   name: "Beautiful Photography",
                   criteria: "Anything as long as it's aesthetically pleasing."
                 }
])

first_contest = Contest.first
first_contest.user = User.first
first_contest.save