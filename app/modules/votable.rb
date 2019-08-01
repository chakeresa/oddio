module Votable
  def total_score
    parameters = {
      votable_type: self.class.to_s.downcase,
      votable_id: self.id
    }
    VoteService.new(parameters).total_score
  end
end
