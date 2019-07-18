class AWS_Service

  def get_recordings
    conn.list_objects(bucket: 'oddio1903').map do |obj|
      Recording.new
  end

  def conn
    s3 = Aws::S3::Client.new
  end
end
