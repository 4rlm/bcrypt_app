puts "Seeding the database ..."


def seed_entry_table
  puts "Seeding the entry table..."
  total_seeds_required = 50
  current_seeds_in_db = Entry.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["title", "body"]
  seeds_to_create.times do
    # entry_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_entry_record = Entry.new(entry_hash)
    new_entry_record.save!
  end

end
seed_entry_table


def seed_user_table
  puts "Seeding the user table..."
  total_seeds_required = 50
  current_seeds_in_db = User.count
  seeds_to_create = total_seeds_required - current_seeds_in_db

  # ["name", "email", "pw_hash"]
  seeds_to_create.times do
    # user_hash = {
    #   name: Faker::Lorem.word,
    #   description: Faker::Lorem.sentence,
    #   status: Faker::Lorem.word,
    #   rating: 5
    # }
    new_user_record = User.new(user_hash)
    new_user_record.save!
  end

end
seed_user_table


