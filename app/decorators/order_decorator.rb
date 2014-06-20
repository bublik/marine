class OrderDecorator < Draper::Decorator
  delegate_all

  def user
    object.user ? object.user.decorate.full_name : '-'
  end

  def payment_status
    status = object.payment_status.split('_').last
    status.eql?('completed') ? icon('ok text-success', 'Completed') : icon('minus-sign text-muted', 'Pending')
  end

  def send_status
    object.send_status.split('_').last
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
end
