require "json"
require "open-uri"

def fetch_data(url)
  begin
    URI.open(url).read
  rescue OpenURI::HTTPError => e
    if e.io.status[0] == "429"
      puts "Rate limited. Waiting for 30 seconds before retrying..."
      sleep(30) # Wait for 30 seconds
      retry
    else
      raise e
    end
  end
end

# Destroy all existing characters
puts "Destroying all characters..."
Character.destroy_all
puts "All characters destroyed."

url = "https://api.jikan.moe/v4/anime/6213/characters"
characters_serialized = fetch_data(url)
parsed_data = JSON.parse(characters_serialized)
puts "Starting to parse"
parsed_data['data'].each do |character_data|
  mal_id = character_data['character']['mal_id'].to_i
  role = character_data['role']

  url_char_details = "https://api.jikan.moe/v4/characters/#{mal_id}"
  character_details_serialized = fetch_data(url_char_details)
  parsed_single_char_data = JSON.parse(character_details_serialized)

  image_url_jpg = parsed_single_char_data['data']['images']['jpg']['image_url']
  name = parsed_single_char_data['data']['name']
  about = parsed_single_char_data['data']['about']
  name_kanji = parsed_single_char_data['data']['name_kanji']
  Character.create!(name: name, image_url: image_url_jpg, details: about, rating: 5, kanji: name_kanji, role: role)

  # Delay to avoid hitting the rate limit
  sleep(1)
end
puts "DB Seeded"
