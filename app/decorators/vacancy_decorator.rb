class VacancyDecorator < Draper::Decorator
  delegate_all

  def link
    h.link_to name, vacancy
  end

  def dom_id
    h.dom_id(object)
  end

  def name
    rank
  end

  def rank
    object.rank.name
  end

  def salary
    "#{object.salary_min} - #{object.salary_max} #{salary_currency}"
  end

  def salary_with_times
    "#{salary} for #{term_in_month} month, <br>from #{from_date}".html_safe
  end

  def from_date
    object.from_date < (Date.today + 7.days) ?
      h.content_tag(:span, object.from_date, class: 'text-danger') :
      object.from_date
  end

  def country
    object.country.name
  end

  def shipowner_country
    object.shipowner_country.name
  end

  def language
    object.language.name
  end

  def vessel_type
    object.vessel_type.name
  end

  def crew_contact
    if object.crewing && object.crewing.contact
      @contact ||= object.crewing.contact
    end
  end

  def crew
    if object.crewing
      @crewing ||= object.crewing
    end
  end

  def crew_name
    crew.company_name
  end

  def crew_mphone
    crew_contact.mphone
  end

  def crew_skype
    crew_contact.skype
  end

  def crew_email
    h.mail_to(crew_contact.email)
  end
end
