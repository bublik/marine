class CertificateDecorator < Draper::Decorator
  delegate_all

  # object.created_at.strftime("%a %m/%d/%y")

  def cert
    object.cert.name
  end

  def country
    object.country.name + (object.is_flag ? ' (flag)' : '')
  end

  def from_date
    object.from_date ? object.from_date.to_s(:db) : ''
  end

  def to_date
    object.is_unlimited ? 'Unlimited' : (object.to_date ? object.to_date.to_s(:db) : '')
  end

end
