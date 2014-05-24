class UserDecorator < Draper::Decorator
  delegate_all

  def name
    object.name || object.email
  end

  def full_name
    object.personal ? "#{object.personal.surname} #{object.personal.name}" : name
  end

  def phone
    h.number_to_phone(object.phone)
  end

  def created_at
    h.l(object.created_at, format: :long)
  end

  def last_sign_in_at
    object.last_sign_in_at ?
      h.l(object.last_sign_in_at, format: :long) : 'never'
  end

  def active
    object.verified? ?
      h.icon('ok text-success') + ' ' + h.l(object.verify_at, format: :long) :
      h.icon('bell text-danger') + ' Waited'
  end

  def cv_updated_at
    object.cv_updated_at ? object.cv_updated_at.strftime("%m/%d/%Y") : 'incomplete'
  end

  def completed?
    object.cv_updated_at
  end

  def required_position
    object.personal ? object.personal.required_position : '-'
  end

  def year_old
    object.personal ? h.distance_of_time_in_words(object.personal.pp_dob, Time.now) : '-'
  end

  def vessel_types
    type_ids = seaservices.pluck(:vessel_type_id)
    type_ids.blank? ? '-' : VesselType.where(id: type_ids).pluck(:name).join(', ')
  end

  def salary
    object.personal ? object.personal.salary : '-'
  end

  def languages
    object.languages.map(&:name).join(',')
  end

  def required_position
    object.personal ? object.personal.required_position : '-'
  end

  def dwts
    object.seaservices ? object.seaservices.pluck(:vessel_dwt).join(', ') : '-'
  end

  def link_to_state
    h.link_to(active, h.activation_path(object), class: 'btn btn-default', title: (object.verified? ? 'Deactivate' : 'Activate'), remote: true, method: :post)
  end

  def locked
    object.access_locked? ?
      h.icon('lock text-danger') + ' ' + h.l(object.locked_at, format: :long) :
      h.icon('ok text-success') + ' Active'
  end

  def link_to_lock
    h.link_to(locked, h.lock_user_path(object), class: 'btn btn-default', title: (object.access_locked? ? 'Unlock' : 'Lock'), remote: true, method: :post)
  end
end
