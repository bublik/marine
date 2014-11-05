module ApplicationHelper

  def calendar_dates
    @dates ||= {as: :date, start_year: Date.today.year - 70, end_year: Date.today.year + 6}
  end

  def icon(type, title = '')
    content_tag(:span, '', class: "glyphicon glyphicon-#{type}", title: title)
  end

  def menu_style
    return '' unless user_signed_in?
    "bg-#{current_user.role}"
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  # arguments {amount: '', currency: 'UAH', description: 'Pay', order_id: ''}
  def liqpay_form(args = {})
    secrets = Rails.application.secrets

    args[:order_id] ||= "#{current_user.id}-#{Time.now.to_i}-send_cv"
    args[:amount] ||= secrets.cv_price
    args[:currency] ||= 'UAH'
    args[:description] ||= "Pay #{args[:amount]} #{args[:currency]}"

    liqpay = ::Liqpay::Liqpay.new(public_key: secrets.liqpay_public_key, private_key: secrets.liqpay_private_key)

    liqpay.cnb_form({
                      amount: args[:amount],
                      currency: args[:currency],
                      #order_id: args[:order_id],
                      sandbox: secrets.sandbox_mode,
                      description: args[:description],
                      server_url: 'http://icrewing.com/orders/confirm',
                      return_url: "http://icrewing.com/orders/status/#{args[:order_id]}"
                    })
  end

end
