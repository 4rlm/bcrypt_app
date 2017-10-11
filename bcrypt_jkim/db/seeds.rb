

10.times do
  User.create({ full_name:Faker::Name.name,
    email_address:Faker::Internet.safe_email,
    password:Faker::ChuckNorris.fact
  })
end
