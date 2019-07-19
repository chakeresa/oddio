namespace :landmarks do
  desc :"Load landmark table"
  task all: %i[clear museum theater]

  desc :"Clear landmarks table"
  task :clear, [:clear] => :environment do
    Landmark.destroy_all
  end

  desc :"Add museum"
  task :museum, [:museum] => :environment do
    TomTomService.type_search(categorySet: 7317).map do |index|
      Landmark.create(
        :name => index[:poi][:name],
        :phone_number => index[:poi][:phone],
        :category => index[:poi][:categories].first,
        :address => index[:address][:freeformAddress],
        :lat => index[:position][:lat],
        :long => index[:position][:lon]
      )
    end
  end

  desc :"Add theater"
  task :theater, [:theater] => :environment do
    TomTomService.type_search(categorySet: 7318).map do |index|
      Landmark.create(
        :name => index[:poi][:name],
        :phone_number => index[:poi][:phone],
        :category => index[:poi][:categories].first,
        :address => index[:address][:freeformAddress],
        :lat => index[:position][:lat],
        :long => index[:position][:lon]
      )
    end
  end
end
