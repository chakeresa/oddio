# frozen_string_literal: true

require 'rails_helper'

describe AWS_Service do
  describe 'recordings' do
    it "test" do
      WebMock.disable!

      something = AWS_Service.new
      binding.pry
    end
  end
end
