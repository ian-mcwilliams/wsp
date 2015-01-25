require 'htmlbeautifier'
# require 'awesome_print'

module TestTwoAppHelper

  def active_support_str
    ActiveSupport::SafeBuffer.new('')
  end

  def get_page_html(page_name)
    @content = ''
    case page_name
      when :login
        get_login_page_html
      when :predict
        get_make_predictions_page_html
      when :view_all
        get_view_all_predictions_page_html
    end
    ActiveSupport::SafeBuffer.new(HtmlBeautifier.beautify(@content))
  end

  def get_form_input_html(text, input)
    content = content_tag(:div,
                          text,
                          class: 'formText')
    content + content_tag(:div,
                          input,
                          class: 'formInput')
  end


  # =====================================================================================
  # ==================================   LOGIN FORM   ===================================
  # =====================================================================================

  def get_login_page_html
    @content << content_tag(:h1, 'Login', id: 'header')
    @content << content_tag(:div,
                  get_login_form_html,
                  id: 'loginForm')
  end

  def get_login_form_html
    form_tag(controller: 'test_two_app', action: 'login', method: 'post') do
      get_login_form_content_html
    end
  end

  def get_login_form_content_html
    content = content_tag(:div,
                  get_form_input_html('Email', email_field(:user, :address)),
                  class: 'formElement')
    content << content_tag(:div,
                  get_form_input_html('Password', password_field_tag(:password)),
                  class: 'formElement')
    content + content_tag(:div, submit_tag('Login'), class: 'submitDiv')
  end

end

  # =====================================================================================
  # =============================   PREDICT MATCHES FORM   ==============================
  # =====================================================================================

  def get_make_predictions_page_html
    @content << content_tag(:h1, 'Make Predictions', id: 'header')
    @content << content_tag(:div,
                  get_make_predictions_form_html,
                  id: 'makePredictionsForm')
  end

  def get_make_predictions_form_html
    form_tag(controller: 'test_two_app', action: 'make_predictions', method: 'post') do
      get_make_predictions_form_content_html
    end
  end

  def get_make_predictions_form_content_html
    content = active_support_str
    @matches.each do |match|
      content << content_tag(:div, get_predict_match_html(match), class: 'predictMatch')
    end
    content + content_tag(:div, submit_tag('Predict'), class: 'submitDiv')
  end

  def get_predict_match_html(match)
    content = active_support_str
    match.each do |_, value|
      team_name = value[:name]
      input_field = text_field_tag(value[:name].downcase.gsub(' ', '_').to_sym, nil, class: 'inputBox')
      content << content_tag(:div,
                  get_form_input_html(team_name, input_field),
                  class: 'predictTeam')
    end
    content
  end


  # =====================================================================================
  # =============================   VIEW PREDICTIONS FORM   =============================
  # =====================================================================================

  def get_view_all_predictions_header_html
    content_tag(:h1, 'View All Predictions', id: 'header')
  end

