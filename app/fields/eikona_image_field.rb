# app/fields/eikona_image_field.rb

require "administrate/field/base"

class EikonaImageField < Administrate::Field::Base
  def to_s
    data
  end

  def image_url
    if data.attached?
      # Assuming you are using ActiveStorage and have a variant defined
      data.variant(resize: "100x100").processed.service_url
    else
      # Default image URL or placeholder
      "/path/to/default/image.jpg"
    end
  end
end