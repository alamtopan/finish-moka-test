module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", errors: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    if flash.present?
      content_tag(:div, class: 'section-alert') do
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
            concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
              concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
              concat content_tag(:span, 'Close', class: 'sr-only')
            end)
            if flash[:errors].present?
              message.each do |word|
                concat "<div class='alert alert-danger alert-dismissible margin-bottom5'>#{word}</div>".html_safe
              end
            else
              concat "#{message}".html_safe
            end
          end)
        end
        nil
      end
    end
  end

  def get_currency(number)
    number = 0 if number.blank?
    number_to_currency(number, :unit => "Rp ", :separator => ",", :delimiter => ".", precision: 0)
  end
end
