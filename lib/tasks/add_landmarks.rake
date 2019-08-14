require 'digest/md5'
namespace :landmarks do
  desc :"Load landmark table"
  task all: %i[governments museums parks theaters]

  desc :"Add governments"
  task :governments, [:governments] => :environment do
    puts "Querying TomTom for governments..."
    landmarks = TomTomService.category_search(categorySet: 7367).map do |index|
      index[:poi][:name]
    end
    puts "#{landmarks.size} governments imported"
    puts "Querying Google for governments..."
    place_ids = landmarks.map do |landmark|
      GoogleService.get_place_id(landmark)
    end
    puts "Updating Landmark resources for governments..."
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_or_update_landmark(details, type = 'government')
    end
    puts "Finished governments"
  end

  desc :"Add museums"
  task :museums, [:museums] => :environment do
    puts "Querying TomTom for museums..."
    landmarks = TomTomService.category_search(categorySet: 7317).map do |index|
      index[:poi][:name]
    end
    puts "#{landmarks.size} musuems imported"
    puts "Querying Google for musuems..."
    place_ids = landmarks.map do |landmark|
      GoogleService.get_place_id(landmark)
    end
    puts "Updating Landmark resources for musuems..."
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_or_update_landmark(details, type = 'museum')
    end
    puts "Finished museums"
  end

  desc :"Add parks"
  task :parks, [:parks] => :environment do
    puts "Querying TomTom for parks..."
    landmarks = TomTomService.category_search(categorySet: 9362).map do |index|
      index[:poi][:name]
    end
    puts "#{landmarks.size} parks imported"
    puts "Querying Google for parks..."
    place_ids = landmarks.compact.map do |landmark|
      GoogleService.get_place_id(landmark)
    end
    puts "Updating Landmark resources for parks..."
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_or_update_landmark(details, type = 'park')
    end
    puts "Finished parks"
  end

  desc :"Add theaters"
  task :theaters, [:theaters] => :environment do
    puts "Querying TomTom for theaters..."
    landmarks = TomTomService.category_search(categorySet: 7318).map do |index|
      index[:poi][:name]
    end
    puts "#{landmarks.size} theaters imported"
    puts "Querying Google for theaters..."
    place_ids = landmarks.compact.map do |landmark|
      GoogleService.get_place_id(landmark)
    end
    puts "Updating Landmark resources for theaters..."
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_or_update_landmark(details, type = 'theater')
    end
    puts "Finished theaters"
  end

  def create_or_update_landmark(details, type)
    puts "Starting Landmark resource update for #{details[:name]}"
    unless details[:photos].nil?
      hashed_details = Digest::MD5.hexdigest(
        "#{details[:name]}
        #{details[:place_id]}
        #{details[:formatted_address]}
        #{details[:formatted_phone_number]}
        #{type}
        #{details[:website]}
        #{details[:photos].first[:photo_reference]}"
      )


      landmark = Landmark.find_or_initialize_by(place_id: details[:place_id])
      puts "Found/created Landmark resource for #{details[:name]}"
      unless landmark.md5_hash == hashed_details
        photo_ref = details[:photos].first[:photo_reference]
        thumb_url = GoogleService.new.get_picture(photo_ref)
        landmark.update(
          name: details[:name],
          address: details[:formatted_address],
          phone_number: details[:formatted_phone_number],
          category: type,
          lat: details[:geometry][:location][:lat],
          long: details[:geometry][:location][:lng],
          website: details[:website],
          photo_reference: thumb_url
        )
        puts "Updated Landmark resource for #{details[:name]}"
      end
    end
  end
end
