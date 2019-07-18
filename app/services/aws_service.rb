class AWS_Service

  def get_recordings
    conn.list_objects(bucket: 'oddio1903')
  end

  private

  def conn
    s3 = Aws::S3::Client.new
  end
end
