class SeaserviceDecorator < Draper::Decorator
  delegate_all

  def duration
    object.on_date && object.off_date ?
      h.distance_of_time_in_words(object.on_date, object.off_date) : '-'
  end

  def rank
    object.rank ? object.rank.name : '-'
  end

  def vessel_type
    object.vessel_type ? object.vessel_type.name : '-'
  end

  def vessel_country_code
    object.vessel_country_code ? object.vessel_country_code.name : '-'
  end
end
