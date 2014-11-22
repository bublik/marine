class Notifications < ActionMailer::Base
  default from: "noreply@icrewing.com"
  layout 'email'

  def access_link(user)
    @user = user
    mail(to: @user.email)
  end

  def invitation(from_user, to_email)
    @from_user = from_user.decorate
    mail(to: to_email, subject: "#{@from_user.full_name} has invited You.")
  end

  def feedback(contact)
    @contact = contact
    mail(to: User.admin.contact.email)
  end

  def thank_email(user)
    @user = user.decorate
    @contact = @user.head_contact.decorate
    @user_contact = @contact.decorate
    @personal = @user.personal.decorate
    @documents = @user.documents.decorate
    @seaservices = @user.seaservices.decorate
    @certificates = @user.ordered_certificates.decorate
    @medical_certificates = @user.medical_certificates.decorate
    @langs = @user.langs.includes(:language)
    @hide_details = false

    #https://github.com/mileszs/wicked_pdf
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(
        template: 'users/cv.pdf.haml',
        layout: 'layouts/cv.pdf.haml'),
      {margin: {top: 10, bottom: 0, left: 10, right: 0}}
    )
    attachments[@personal.pdf_file_name_with_extension] = pdf

    #store STATIC PDF document
    File.open(@personal.pdf_file_name_full_path, 'wb') do |file|
      file << pdf
    end

    mail(to: @user.email,  subject: 'Thanks for registration.')
  end

  def new_user_cv(agency_subscription, personal)
    @agency = agency_subscription
    attachments[personal.pdf_file_name_with_extension] = File.read(personal.pdf_file_name_full_path)
    mail(to: agency_subscription.email, subject: 'New CV.')
  end

  def crewing_credentials(user)
    @password = user.password
    @user = user.decorate

    mail(to: user.email)
  end

  def account_verified(user)
    @user = user.decorate
    mail(to: user.email)
  end

  def new_crewing_created(user, agency)
    @agency = agency
    mail(to: user.email)
  end
end
