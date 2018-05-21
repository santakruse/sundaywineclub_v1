# encoding: utf-8

class WineImageUploader < CarrierWave::Uploader::Base

include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['wine_picture']

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  def public_id
    return wine.id
  end 

end
