module FlashHelper
  def flash_messeges
    flash_alert
    flash_errors
  end

  def flash_alert
    content_tag(:p, flash[:alert], { class: 'flash alert' }) if flash[:alert]
  end

  def flash_errors
    flash[:errors]&.each_with_index do |_item, index|
      content_tag(:p, flash[:errors][index], { class: 'flash error' })
    end
  end
end
