Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-1.amazonaws.com'
Paperclip::Attachment.default_options.merge!(use_timestamp: false)


# if Rails.env.production?
#   Paperclip.interpolates(:placeholder) do |attachment, style|
#     ActionController::Base.helpers.asset_path("missing_#{style}.png")
#   end
# end