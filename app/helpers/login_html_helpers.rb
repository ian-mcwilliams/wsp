module LoginHtmlHelpers

  # =====================================================================================
  # ==================================   LOGIN FORM   ===================================
  # =====================================================================================

  def get_login_page_html_list
    {
        left_margin_div: {},
        login_form: {
            login_email_div: {
                login_email_text: {},
                login_email_input: {}
            },
            login_password_div: {
                login_password_text: {},
                login_password_input: {}
            },
            login_form_submit: {}
        },
        right_margin_div: {}
    }
  end


  def get_login_page_html_list_detail
    {
        left_margin_div: {
            tag: :div,
            args: { class: 'col-xs-4'}
        },
        login_form: {
            tag: :form,
            args: { controllor: 'test_two_app', action: 'login', method: 'post' },
            div: { args: { class: 'col-xs-4' } }
        },
        login_email_div: {
            tag: :div,
            args: { class: 'row' }
        },
        login_email_text: {
            text: 'Email:',
            div: { args: { class: 'col-xs-6' } }
        },
        login_email_input: {
            tag: :input,
            args: { class: '' },
            div: { args: { class: 'col-xs-6' } }
        },
        login_password_div: {
            tag: :div,
            args: { class: 'row' }
        },
        login_password_text: {
            text: 'Password:',
            div: { args: { class: 'col-xs-6' } }
        },
        login_password_input: {
            tag: :input,
            args: { class: '' },
            div: { args: { class: 'col-xs-6' } }
        },
        login_form_submit: {
            tag: :submit,
            args: { class: 'btn-primary btn-lg' },
            text: 'Login',
            div: { args: { class: 'row' } }
        },
        right_margin_div: {
            tag: :div,
            args: { class: 'col-xs-4' }
        }
    }
  end

end