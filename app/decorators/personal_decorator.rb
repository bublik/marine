class PersonalDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.surname} #{object.name}"
  end

  def phone
    object.user.contact ? object.user.contact.phone : '-'
  end

  def mphone
    object.user.contact ? object.user.contact.mphone : '-'
  end

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
    object.overallsize ? object.overallsize.overall_size : ''
  end

  def photo_path
    object.photo.path || 'fallback/default.png'
  end

  def photo
    h.image_tag(object.photo_url, width: '180px')
  end

  def pdf_file_name
    "#{object.surname}_#{object.name}_#{object.rank.name}_#{object.user.uuid}"
  end

  def pdf_file_name_with_extension
    pdf_file_name + '.pdf'
  end

  def pdf_file_name_full_path
    Rails.root.join('public/uploads/pdfs', pdf_file_name_with_extension)
  end
end