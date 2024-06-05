# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"
require "open-uri"

url = "https://api.jikan.moe/v4/anime/6213/characters"
characters_serialized = URI.open(url).read
parsed_data = JSON.parse(characters_serialized)

parsed_data['data'].each do |character_data|
  mal_id = character_data['character']['mal_id'].to_i
  role = character_data['role']

  url_char_details = "https://api.jikan.moe/v4/characters/#{mal_id}"
  character_details_serialized = URI.open(url_char_details).read
  parsed_single_char_data = JSON.parse(character_details_serialized)

  image_url_jpg = parsed_single_char_data['data']['images']['jpg']['image_url']
  name = parsed_single_char_data['data']['name']
  about = parsed_single_char_data['data']['about']
  name_kanji = parsed_single_char_data['data']['name_kanji']
  puts "Kanji: #{name_kanji}"
  puts "Name: #{name}"
  puts "Role: #{role}"
  puts "Image URL (JPG): #{image_url_jpg}"
  puts "About: #{about}"
end
