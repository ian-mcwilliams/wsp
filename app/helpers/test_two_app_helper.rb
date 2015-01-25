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
        get_login_html_str
      when :predict
        get_make_predictions_page_html
      when :view_all
        get_view_all_predictions_header_html
    end
    ActiveSupport::SafeBuffer.new(HtmlBeautifier.beautify(@content))
  end

  # =====================================================================================
  # =============================   VIEW PREDICTIONS FORM   =============================
  # =====================================================================================

  def get_view_all_predictions_header_html
    content_tag(:h1, 'View All Predictions', id: 'header')
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
    content = content_tag(:div,
                get_predict_team_item(match[:home_team][:name]),
                class: 'predictTeam')
    content + content_tag(:div,
                get_predict_team_item(match[:away_team][:name]),
                class: 'predictTeam')
  end

  def get_predict_team_item(team_name)
    content = content_tag(:div,
                team_name,
                class: 'predictTeamItem teamName')
    content + content_tag(:div,
                text_field_tag(team_name.downcase.gsub(' ', '_').to_sym, nil, class: 'inputBox'),
                class: 'predictTeamItem')
  end


  # =====================================================================================
  # ==================================   LOGIN FORM   ===================================
  # =====================================================================================

  def get_login_header_html
    content_tag(:h1, 'Login', id: 'header')
  end

  def get_login_form_div_html
    form_for(login) do |f|
      f.label :name
      f.text_field :name

      f.label :email
      f.email_field :email

      f.label :password
      f.password_field :password

      # f.submit 'Login', class:

      # "Login"
      # 'Login'
      # msg = 'to the\' system'
      # "Login #{msg}"
      # "Login to it's a knockout"
  end



=begin
    content_tag(:div, email_field(:user, :address))
    content_tag(:div, password_field_tag(:password))
    content_tag(:div, label_tag :user, 'Username:')
    content_tag(:div, submit_tag('Login'), class: 'submitDiv')
  end
=end

end
end
