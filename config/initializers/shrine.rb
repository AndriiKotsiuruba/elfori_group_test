require 'shrine'
require 'shrine/storage/memory'
require 'shrine/storage/s3'

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays

# https://shrinerb.com/docs/plugins/remove_invalid
Shrine.plugin :remove_invalid

# https://shrinerb.com/docs/plugins/validation_helpers
Shrine.plugin :validation_helpers

# https://shrinerb.com/docs/plugins/add_metadata
Shrine.plugin :add_metadata

# https://shrinerb.com/docs/plugins/pretty_location
Shrine.plugin :pretty_location, class_underscore: true

# https://shrinerb.com/docs/plugins/determine_mime_type
Shrine.plugin :determine_mime_type, analyzer: :marcel

# https://shrinerb.com/docs/plugins/download_endpoint
Shrine.plugin :download_endpoint, prefix: 'attachments'

case Rails.env.to_sym
when :development, :staging, :production
  s3_options = {
    bucket: ENV.fetch('AWS_S3_BUCKET') { '' },
    region: ENV.fetch('AWS_S3_REGION') { 'us-east-2' },
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID') { '' },
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY') { '' }
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)
  }
when :test
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end
