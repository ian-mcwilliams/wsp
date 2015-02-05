module PredictMatchesHtmlHelpers
  # =====================================================================================
  # =============================   PREDICT MATCHES FORM   ==============================
  # =====================================================================================

  def set_make_predictions_page_html_list
    @html_list = {
        predict_match_form_div: {
            predict_match_form: {
                predict_match_div: {
                    predict_match_text: {},
                    predict_match_input: {}
                },
                predict_match_form_submit: {}
            }
        }
    }
  end

  def set_make_predictions_page_html_list_detail
    @html_list_detail = {
        predict_match_form_div: {
            tag: :div,
            id: 'predictMatchForm'
        },
        predict_match_form: {
            tag: :form,
            controller: 'test_two_app',
            action: 'predict_match',
            method: 'post'
        },
        predict_match_div: {
            tag: :div,
            class: 'predictMatch',
            loop: {
                each: @match
            }
        },
        predict_match_text: {
            tag: :text
        },
        predict_match_input: {
            tag: :input
        },
        predict_match_form_submit: {
            tag: :submit,
            class: 'submitDiv'
        }
    }
  end


  def get_make_predictions_page_html
    @current_page_html_content_str << content_tag(:div,
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
end
