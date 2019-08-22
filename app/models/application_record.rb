class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort(votable_type, collection)
    if collection.any?
      array_of_ids = collection.pluck(:id)
      parameters = {
        votable_type: votable_type,
        array_of_ids: array_of_ids
      }
      api_response = VoteService.new(parameters).sort
      object_score_hash = {}

      api_response.each do |id, total_score|
        object = self.find(id)
        object_score_hash[object] = total_score
      end
      
      object_score_hash
    else
      collection
    end
  end
end
