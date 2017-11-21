

  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAIZMFYVL4WWOCM3UQ',
      :aws_secret_access_key => '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',
      :region                => 'us-east-1'
    }
  
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    # config.fog_host = "https://acer1456.s3.amazonaws.com"
    config.fog_directory  = 'shushop'
    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
    config.storage = :fog
    
  end