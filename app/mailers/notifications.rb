class Notifications < ActionMailer::Base
  default from: "noreplay@example.com"
  layout 'email'

  def access_link(user)
    @user = user
    mail(to: @user.email)
  end

  def thank_email(user)
    @user = user.decorate
    @contact = @user.head_contact.decorate
    @user_contact = @contact.decorate
    @personal = @user.personal.decorate
    @documents = @user.documents.decorate
    @seaservices = @user.seaservices.last_years(5).decorate
    @certificates = @user.certificates.decorate
    @medical_certificate = @user.medical_certificates.last
    @langs = @user.langs.includes(:language)
    @hide_details = false

    #https://github.com/mileszs/wicked_pdf
    attachments[@personal.pdf_file_name+'.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(
        template: 'users/cv.pdf.haml',
        layout: 'layouts/cv.pdf.haml'),
      {margin: {top: 10, bottom: 0, left: 10, right: 0}}
    )

    mail(to: @user.email)
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
