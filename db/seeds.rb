# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

puts "Creating countries"
Country.find_or_create_by(local_name: "Hrvatska", english_name: "Croatia", available_locales: ["hr"], alpha_2_code: "hr")
Country.find_or_create_by(local_name: "Italia", english_name: "Italy", available_locales: ["it"], alpha_2_code: "it")
Country.find_or_create_by(local_name: "United States of America", english_name: "United States of America", available_locales: ["en"], alpha_2_code: "us")

Country.order(:id).all.each do |country|
  path = File.join(Rails.root, "db/seed_data/cities", "#{country.alpha_2_code}.txt")

  puts "\nImporting cities in #{country.english_name}"
  raise "File missing: #{path}" unless File.exists?(path)

  cities = File.read(path).split(/\n/).map(&:strip)
  puts "#{cities.count} cities found"

  cities.each { |city| City.find_or_create_by(name: city, country: country) }
end
