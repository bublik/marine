module ApplicationHelper

  def icon(type, title = '')
    content_tag(:span, '', class: "glyphicon glyphicon-#{type}", title: title)
  end

  def menu_style
    return '' unless user_signed_in?
    case current_user.role
      when /admin/
        'bg-danger'
      when /crewing/
        'bg-crewing'
      when /manager/
        'bg-manager'
    end
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

end
