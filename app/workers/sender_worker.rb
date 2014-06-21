class SenderWorker
  include Sidekiq::Worker

  sidekiq_options :retry => false, :backtrace => true

  def perform(agency_subscribtion_id, user_id)
    agency = AgencySubscription.find(agency_subscribtion_id)
    user = User.find(user_id)
    personal = user.personal.decorate

    personal.pdf_file_name_full_path

    Rails.logger.info("Send email to #{agency.email} #{agency.name} with PDF user_id #{user_id} PDF_full_path #{personal.pdf_file_name_full_path}")

    Notifications.new_user_cv(agency, personal).deliver
  end

end