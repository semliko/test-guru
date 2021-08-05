module FlashHelper

  def flash_class(level)
    level = level.to_sym
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-primary"
    end
  end

  def flash_messeges
    flash_alert
    flash_errors
  end

  def flash_alert
    content_tag(:p, flash[:alert], { class: 'alert alert-error' }) if flash[:alert]
  end

  def flash_errors
    flash[:errors]&.each_with_index do |_item, index|
      content_tag(:p, flash[:errors][index], { class: 'alert alert-danger' })
    end
  end
end
