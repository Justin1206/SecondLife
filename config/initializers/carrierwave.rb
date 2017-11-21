


  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAJ5BLPQH7G57L72KA',       # your aws access key id
      :aws_secret_access_key  => '2eKfj8yuERe+usPmyITwnC2o9czU+HX6PsBnykqY',       # your aws secret access key
      :region                 => 'ap-northeast-1'  # your bucket's region in S3, defaults to 'us-east-1'
    }
    # your S3 bucket name
    config.fog_directory  = 'shucoupon'
    # custome your domain on aws S3, defaults to nil
    config.fog_host       = 'http://shushop.herokuapp.com/'
    config.fog_public     = true                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end