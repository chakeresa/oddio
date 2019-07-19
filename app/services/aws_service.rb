class AWS_Service

  def get_recordings
    read.list_objects(bucket: 'oddio1903')
  end

  private

  def write
    s3 = Aws::S3::Resource.new
  end

  def read
    s3 = Aws::S3::Client.new
  end
end
