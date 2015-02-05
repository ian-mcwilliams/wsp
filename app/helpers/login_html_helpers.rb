module LoginHtmlHelpers

  # =====================================================================================
  # ==================================   LOGIN FORM   ===================================
  # =====================================================================================

  def get_login_page_html
    @current_page_html_content_str << content_tag(:div,
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