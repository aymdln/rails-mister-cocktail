# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require 'json'
print "Clean base"
Ingredient.destroy_all
puts " [OK]".colorize(:green)
print "Get to api"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

puts " [OK]".colorize(:green)

print "Add Ingredients"
ingredient["drinks"].each do |i|
    Ingredient.create(name: i["strIngredient1"])
end
puts " [OK]".colorize(:green)
puts "Finish ... add #{Ingredient.count} ingredients"

nmb = 5

print "Add #{nmb} cocktails"

nmb.times do 
    Cocktail.create!(name: Faker::Coffee.blend_name)
end

puts " [OK]".colorize(:green)