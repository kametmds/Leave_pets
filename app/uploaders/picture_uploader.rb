class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  if Rails.env.development? || Rails.env.test?
    storage :file
    def default_url(*args)
      # For Rails 3.1+ asset pipeline compatibility:
      # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
      "noimage"
      # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    end
  else
    storage :fog
    def default_url(*args)
      ActionController::Base.helpers.asset_path("fallback/" + [version_name, "noimage.jpg"].compact.join('_'))
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # def filename
  #   "something.jpg" if original_filename
  # end
end
