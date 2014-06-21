class Order < ActiveRecord::Base
  belongs_to :user

  enum send_status: {send_pending: 0, send_completed: 1}
  enum payment_status: {payment_pending: 0, payment_completed: 1}

  validates_inclusion_of :payment_type, in: ['send_cv']
  validates_presence_of :uid

  def send_cv
    AgencySubscription.active.ids.each do |subscriber_id|
      SenderWorker.perform_async(subscriber_id, self.user_id)
    end
    self.send_completed!
  end

end
