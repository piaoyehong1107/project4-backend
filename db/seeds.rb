# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# yehong=User.create(username: "yehong", password:"yehong")
# minshan=User.create(username: "minshan", password:"minshan")
# stock1=Stock.create()
# stock2=Stock.create()
favorite1=Favorite.create(user_id: 1, stock_id: 1)
favorite2=Favorite.create(user_id: 1, stock_id: 2)
favorite1=Favorite.create(user_id: 2, stock_id: 1)