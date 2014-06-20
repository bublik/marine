class OrderDecorator < Draper::Decorator
  delegate_all

  def user
    object.user ? object.user.decorate.full_name : '-'
  end

  def payment_status
    decorate_status(object.payment_status)
  end

  def send_status
    decorate_status(object.send_status)
  end

  def payment_type
    case object.payment_type
      when 'send_cv'
        'Send CV to crew Agencies.'
      else
        'Unknown'
    end
  end

  def created_at
    object.created_at.to_s(:short)
  end

  def updated_at
    object.updated_at.to_s(:short)
  end

  private
  def decorate_status(status = '')
    status.split('_').last.eql?('completed') ? h.icon('ok text-success', 'Completed') : h.icon('minus-sign text-muted', 'Pending')
  end
end
