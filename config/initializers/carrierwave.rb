

  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAJC6AJGVZ4GKDWCAA',
      :aws_secret_access_key => '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',
      :region                => 'sa-east-1'
    }
  
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_public     = false
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
    config.storage = :fog
  end