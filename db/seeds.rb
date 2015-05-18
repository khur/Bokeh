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
users = User.create([
    {
        image: "phofile pic",
        name: "Abraham Lincoln",
        email: "Abram@example.com",
        username: "honest_abe",
        password_digest: "password"
   },
    {
        image: "phofile pic",
        name: "Doge",
        email: "doge@example.com",
        username: "doge_style",
        password_digest: "password"
    },
    {
        image: "phofile pic",
        name: "Mick",
        email: "mick@example.com",
        username: "mick",
        password_digest: "password"
    }

])

contests = Contest.create([
    {name: "Light Contst"},
    {name: "Composition Contest"},
    {name: "Portraits"},
    {name: "Primary Colors"},
    {name: "Swimsuit Contest"}
 ])  


# photos = Photo.create([
#   {url: "http://assets.worldwildlife.org/photos/2090/images/hero_small/Sumatran-Tiger-Hero.jpg?1345559303 ",
#     score: 5
#     },
#     {url: " http://images6.fanpop.com/image/photos/32200000/Tiger-tigers-32293802-500-627.jpg",
#     score: 2
#     },
#     {url: " https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ5W3dzD0LaaTL8XYOM8P1F5EdD5fjpafkPnP9I3Ti9quvy-peC",
#     score: 1
#     },
#     {url: "http://imgc.allpostersimages.com/images/P-473-488-90/38/3815/DCQIF00Z/posters/adam-jones-bengal-tiger-face-panthera-tigris-asia.jpg ",
#     score: 4
#     },
#     {url: "http://goodnature.nathab.com/wp-content/uploads/2011/03/19-baby-tiger.jpg ",
#     score: 6
#     }


# ])
