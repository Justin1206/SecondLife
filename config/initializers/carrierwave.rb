CarrierWave.configure do |config|
    if Rails.env.test?
      config.storage = :file
      config.enable_processing = false
      
    else
      config.storage = :fog
      config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV['AKIAJ5BLPQH7G57L72KA'],
        aws_secret_access_key: ENV['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'],
        region:                ENV['ap-northeast-1']
      }
  
      if Rails.env.production?
        config.fog_directory  = ENV['shucoupon']
      elsif Rails.env.staging?
        config.fog_directory  = ENV['shucoupon']
      elsif Rails.env.development?
        config.fog_directory  = ENV['shucoupon']
      end
    end
  end