module LoginHtmlHelpers

  # =====================================================================================
  # ==================================   LOGIN FORM   ===================================
  # =====================================================================================

  def set_login_page_html_list
    @html_list = {
        login_form_div: {
            login_form: {
                login_email_div: {
                    login_email_text_div: {},
                    login_email_input_div: {
                        login_email_input: {}
                    }
                },
                login_password_div: {
                    login_password_text_div: {},
                    login_password_input_div: {
                        login_password_input: {}
                    }
                },
                login_form_submit_div: {
                    login_form_submit: {}
                }
            }
        }
    }
  end


  def set_login_page_html_list_detail
    @html_list_detail = {
        login_form_div: {
            tag: :div,
        },
        login_form: {
            tag: :form,
            args: { controllor: 'test_two_app', action: 'login', method: 'post' },
        },
        login_email_div: {
            tag: :div,
        },
        login_email_text_div: {
            tag: :div,
            args: { class: 'formTextDiv' }
        },
        login_email_input_div: {
            tag: :div,
            args: { class: 'formInputDiv' }
        },
        login_email_input: {
            tag: :input,
            args: { class: 'formInputDiv' }
        },
        login_password_div: {
            tag: :div,
        },
        login_password_text_div: {
            tag: :div,
            args: { class: 'formTextDiv' }
        },
        login_password_input_div: {
            tag: :div,
            args: { class: 'formInputDiv' }
        },
        login_password_input: {
            tag: :input,
            args: { class: 'formInput' }
        },
        login_password_submit_div: {
            tag: :div,
            args: { class: 'formSubmitDiv' }
        },
        login_password_submit: {
            tag: :submit,
            args: { class: 'formSubmit' }
        }
    }
  end







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
                          get_form_input_html('Email', email_field(:user, :email)),
                          class: 'formElement')
    content << content_tag(:div,
                           get_form_input_html('Password', password_field_tag(:password)),
                           class: 'formElement')
    content + content_tag(:div, submit_tag('Login'), class: 'submitDiv')
  end

end