# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#AdminUser.create!(email: 'admin@example.com', password: 'y', password_confirmation: 'password')

50.times do
    User.create(
        {
           username: Faker::Games::SuperSmashBros.fighter,
           photo: Faker::Avatar.image,
           email: Faker::Internet.email,
           password: '123123',
        }
    )
end

50.times do
    user = rand(1..50)
    Tweet.create(
        {
            content: Faker::Games::LeagueOfLegends.quote,
            user_id: user
        }
    )
end
