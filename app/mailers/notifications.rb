class Notifications < ActionMailer::Base
  default from: "noreplay@example.com"
  layout 'cv'

  def access_link(user)
    @user = user
    mail(to: @user.email)
  end

  def thank_email(user)
    @user = user.decorate
    @personal = @user.personal.decorate
    @documents = @user.documents.decorate
    @seaservices = @user.seaservices.last_years(5).decorate
    @certificates = @user.certificates.decorate
    @last_medical_certificate = @user.medical_certificates.last

    file_name = "#{@personal.surname}_#{@personal.name}_#{@personal.rank}_#{@user.uuid}.pdf"

    #https://github.com/mileszs/wicked_pdf
    attachments[file_name] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'users/cv.pdf.haml', layout: 'layouts/cv.pdf.haml'),
      {margin: {top: 10,
                bottom: 0,
                left: 10,
                right: 0}
      })

    mail(to: @user.email)
  end
end
