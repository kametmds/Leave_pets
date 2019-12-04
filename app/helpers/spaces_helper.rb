module SpacesHelper
  def rating_average(space)
    space.reviews.average(:rate).floor(2)
  end
end
