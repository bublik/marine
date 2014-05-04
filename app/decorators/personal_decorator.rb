class PersonalDecorator < Draper::Decorator
  delegate_all

  def rank
    object.rank.name
  end

  def required_salary
    object.salary.amount
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

  def photo
    h.image_tag(object.photo, width: '180px')
  end
end