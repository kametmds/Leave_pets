module SpacesHelper
  def rating_average(space)
    space.reviews.average(:rate).floor(2)
  end

  include ActsAsTaggableOn::TagsHelper

  def format_phone(str)
    return str if str.blank?
    case str.size
    when 10
      str.gsub(/(\d{2})(\d{4})(\d{4})/, '\1-\2-\3')
    when 11
      str.gsub(/(\d{3})(\d{4})(\d{4})/, '\1-\2-\3')
    else
      str
    end
  end

end
