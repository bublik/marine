class PersonalDecorator < Draper::Decorator
  delegate_all

  def rank
    object.rank.name
  end

  def required_salary
    h.number_to_currency(object.salary)
  end

  def marital
    object.marital.name
  end

  def height
    "#{object.height.height} sm."
  end

  def weight
    "#{object.weight.weight} kg."
  end

  def eye
    object.eye.name
  end

  def hair
    object.hair.color
  end

  def shoe
    object.shoe.shoes_size
  end

  def overallsize
    object.overallsize.overall_size
  end

  def photo_path
    object.photo.path || 'fallback/default.png'
  end

  def photo(hide = false)
    h.image_tag(hide ? object.photo.default_url : object.photo_url, width: '180px')
  end

  def pdf_file_name
    "#{object.surname}_#{object.name}_#{object.rank.name}_#{object.user.uuid}"
  end
end