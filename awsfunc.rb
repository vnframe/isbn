require "rubygems"
require "aws-sdk"
load"./local_env.rb"
#Aws.use_bundled_cert!
def connect_to_bucket(id)
 
Aws::S3::Client.new(
  # access_key_id:ENV['AWS_ACCESS_KEY_ID']
  # secret_access_key:ENV['AWS_SECRET_ACCESS_KEY']
  # region:ENV['AWS_REGION'] 
)
#id = "Tordffei" + "/n"
  file = 'awsisbn.csv'
  write_file = File.open(file, "a")
  write_file << id 
  write_file.close
  bucket = 'csv-isbn'
  s3 = Aws::S3::Resource.new(region: 'us-east-2')
  obj = s3.bucket(bucket).object(file)
  File.open(file, 'rb') do |file|
obj.put(body: file)
  end

end


#connect_to_bucket(id)

puts "I'M RUNNING"