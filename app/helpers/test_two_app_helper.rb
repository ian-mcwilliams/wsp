require 'htmlbeautifier'
# require 'awesome_print'

module TestTwoAppHelper

  def active_support_str(str='')
    ActiveSupport::SafeBuffer.new(str)
  end

  def prepare_html_str(str)
    active_support_str(HtmlBeautifier.beautify(str))
  end

  def get_page_html(page_name)
    @current_page_html_content_str = ''
    case page_name
      when :login
        get_login_page_html
      when :predict
        get_predict_match_page_html
      when :view_all
        return
        # get_view_all_predictions_page_html
    end
    prepare_html_str(@current_page_html_content_str)
  end

  def get_form_input_html(text, input)
    content = content_tag(:div,
                          text,
                          class: 'formText')
    content + content_tag(:div,
                          input,
                          class: 'formInput')
  end

  def get_page_frame_html
    prepare_html_str(content_tag(:h1, @current_page_title, id: 'header'))
  end


  # =====================================================================================
  # =============================   VIEW PREDICTIONS FORM   =============================
  # =====================================================================================


end

