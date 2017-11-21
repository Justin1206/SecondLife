


  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAJC6AJGVZ4GKDWCAA',       # your aws access key id
      :aws_secret_access_key  => 'TTCcHIYIcyGS/k3Uj9SNL3A/U0MsI5BIXc8epeNt',       # your aws secret access key
      :region                 => 'sa-east-1'  # your bucket's region in S3, defaults to 'us-east-1'
    }
    # your S3 bucket name
    config.fog_directory  = 'shucoupon'
    # custome your domain on aws S3, defaults to nil
  end