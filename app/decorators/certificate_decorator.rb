class CertificateDecorator < Draper::Decorator
  delegate_all

  def cert
    object.cert.name
  end

  def country
    object.country.name + (object.is_flag ? ' (flag)' : '')
  end

  def from_date
    object.from_date ? object.from_date : ''
  end

  def to_date
    if object.is_unlimited
      'Unlimited'
    else
      css_class = object.to_date && (object.to_date > Date.today) ? 'text-success' : 'text-danger'
      object.to_date ? h.content_tag(:span, object.to_date, class: css_class) : ''
    end

  end

end
