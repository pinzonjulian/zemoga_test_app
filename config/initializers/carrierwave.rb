if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider    = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['S3_SECRET_KEY'],                        # required
      aws_secret_access_key: ENV['S3_ACCESS_KEY'],                        # required
      region:                'us-east-1',                  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']                          # required
    config.fog_public     = false                                        # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
  end
end
