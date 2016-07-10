if Rails.env == "development"
   S3_CREDENTIALS = { :access_key_id => ENV['access_key_id'], :secret_access_key => ENV['secret_access_key'], :bucket => "gordiboda-dev"}
 else
   S3_CREDENTIALS = Rails.root.join("config/application.yml")
end

# if Rails.env == "production"
#    S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => "ourbucket"}
#  else
#    S3_CREDENTIALS = Rails.root.join("config/s3.yml")
# end