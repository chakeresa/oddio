namespace :landmarks do
  desc :"Load landmark table"
  task all: %i[clear governments museums parks theaters]

  desc :"Clears landmarks table"
  task :clear, [:clear] => :environment do
    Landmark.destroy_all
  end

  desc :"Add governments"
  task :governments, [:governments] => :environment do
    landmarks = TomTomService.category_search(categorySet: 7367).map do |index|
      index[:poi][:name]
    end
    place_ids = landmarks.map do |landmark|
      GoogleService.landmarks_place_ids(landmark)
    end
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_landmark(details, type = 'government')
    end
  end

  desc :"Add museums"
  task :museums, [:museums] => :environment do
    landmarks = TomTomService.category_search(categorySet: 7317).map do |index|
      index[:poi][:name]
    end
    place_ids = landmarks.map do |landmark|
      GoogleService.landmarks_place_ids(landmark)
    end
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_landmark(details, type = 'museum')
    end
  end

  desc :"Add parks"
  task :parks, [:parks] => :environment do
    landmarks = TomTomService.category_search(categorySet: 9362).map do |index|
      index[:poi][:name]
    end
    place_ids = landmarks.compact.map do |landmark|
      GoogleService.landmarks_place_ids(landmark)
    end
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_landmark(details, type = 'park')
    end
  end

  desc :"Add theaters"
  task :theaters, [:theaters] => :environment do
    landmarks = TomTomService.category_search(categorySet: 7318).map do |index|
      index[:poi][:name]
    end
    place_ids = landmarks.compact.map do |landmark|
      GoogleService.landmarks_place_ids(landmark)
    end
    place_ids.compact.each do |id|
      details = GoogleService.get_details(id)
      create_landmark(details, type = 'theater')
    end
  end

  def create_landmark(details, type)
    unless details[:photos].nil?
      Landmark.create(
        name: details[:name],
        address: details[:formatted_address],
        phone_number: details[:formatted_phone_number],
        category: type,
        lat: details[:geometry][:location][:lat],
        long: details[:geometry][:location][:lng],
        website: details[:website],
        place_id: details[:place_id],
        photo_reference: details[:photos].first[:photo_reference]
      )
    end
  end
end
