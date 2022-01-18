# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Country.find_or_create_by(local_name: "Hrvatska", english_name: "Croatia", available_locales: ["hr"], alpha_2_code: "hr")
Country.find_or_create_by(local_name: "Italia", english_name: "Italy", available_locales: ["it"], alpha_2_code: "it")
Country.find_or_create_by(local_name: "United States of America", english_name: "United States of America", available_locales: ["en"], alpha_2_code: "us")
