# frozen_string_literal: true

require 'rails_helper'

describe AWS_Service do
  it "has expected contents" do
    VCR.use_cassette('AWS_service_spec') do
      aws_service = AWS_Service.new

      # should as of this test have 3 objects in S3 Bucket 'oddio1903'
      expect(aws_service.get_recordings.class)
        .to eq(Seahorse::Client::Response)
      expect(aws_service.get_recordings.contents.class)
        .to eq(Aws::Xml::DefaultList)
      expect(aws_service.get_recordings.contents.first.class)
        .to eq(Aws::S3::Types::Object)
      expect(aws_service.get_recordings.contents.count)
        .to eq(3)
    end
  end
end
