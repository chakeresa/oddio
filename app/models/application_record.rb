class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort(votable_type, collection)
    array_of_ids = collection.pluck(:id)
    parameters = {
      votable_type: votable_type,
      array_of_ids: array_of_ids
    }
    hash = VoteService.new(parameters).sort
    # TODO: map back to objects
  end
end
