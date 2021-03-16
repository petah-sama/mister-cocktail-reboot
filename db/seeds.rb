puts 'Fetching ingredients from remote JSON'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get(url)
json = JSON.parse(response.body, symbolize_names: true)


puts 'Throwing away old and moldy ingredients 🤮'

Ingredient.destroy_all


puts 'Buying new and fresh ingredients 😌'

json[:drinks]. each do |drink|
    Ingredient.create!(name: drink[:strIngredient1])
end


puts 'Throwing away old cocktails 🤮'

Cocktail.destroy_all


puts 'Making new cocktails for the bar 🍹'

20.times do 
    first = Faker::Color.color_name.capitalize
    second = Faker::Cannabis.strain

    Cocktail.create!(name: "#{first} #{second}")
end

puts "EVERYTHING'S READY FOR PARTY 🥳🥳🥳"


