
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAJ5BLPQH7G57L72KA",
      :aws_secret_access_key  => "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",
      :region                 => 'ap-northeast-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "shucoupon"
end