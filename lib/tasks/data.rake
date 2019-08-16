namespace :data do
  task :populate, [:users_quantity, :pets_quantity] => [:environment] do |t, args|
    users_quantity = args[:users_quantity].to_i

    users_quantity.times do |_i|
      email = Faker::Internet.email
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      age = rand(0..100)

      User.create(email: email, first_name: first_name, last_name: last_name, age: age)
    end

    pets_quantity = args[:pets_quantity].to_i

    pets_quantity.times do |_i|
      user = User.all.sample
      name = Faker::Name.name
      animal_species = Faker::Creature::Animal.name
      age = rand(0..100)

      Pet.create(name: name, animal_species: animal_species, age: age, user: user)
    end
  end
end
