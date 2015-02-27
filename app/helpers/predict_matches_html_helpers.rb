module PredictMatchesHtmlHelpers

  # =====================================================================================
  # =============================   PREDICT MATCHES FORM   ==============================
  # =====================================================================================

  def set_predict_matches_page_html_list
    @html_list = {
        left_margin_div: {},
        predict_match_form_div: {
            predict_match_form: {
                predict_match_div: {
                    predict_match_team_div: {
                        predict_match_team_text_div: {},
                        predict_match_team_input_div: {
                            predict_match_team_input: {}
                        }
                    }
                },
                predict_match_form_submit_div: {
                    predict_match_form_submit: {}
                }
            }
        },
        right_margin_div: {}
    }
  end

  def set_predict_matches_page_html_list_detail
    @html_list_detail = {
        left_margin_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12'}
        },
        predict_match_form_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12' }
        },
        predict_match_form: {
            tag: :form,
            args: { controller: 'test_two_app', action: 'predict_matches', method: 'post' }
        },
        predict_match_div: {
            tag: :div,
            args: { class: 'row col-xs-12 testDiv3' },
            loop: {
                each: '@matches=>@teams'
            }
        },
        predict_match_team_div: {
            tag: :div,
            args: { class: 'row testDiv1' },
            loop: {
                each: '@teams=>@team'
            }
        },
        predict_match_team_text_div: {
            tag: :div,
            args: { class: 'col-xs-6 testDiv4' },
            text: '@team##name'
        },
        predict_match_team_input_div: {
            tag: :div,
            args: { class: 'col-xs-6' }
        },
        predict_match_team_input: {
            tag: :input,
            args: { class: 'testDiv2', style: 'width:32px' },
            name: '@team##key'
        },
        predict_match_form_submit_div: {
            tag: :div,
            args: { class: 'row' }
        },
        predict_match_form_submit: {
            tag: :submit,
            args: { class: 'btn-primary btn-lg' },
            value: 'Predict'
        },
        right_margin_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12' }
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
      input_field = text_field_tag(value[:key], nil, class: 'inputBox')
      content << content_tag(:div,
                             get_form_input_html(value[:name], input_field),
                             class: 'predictTeam')
    end
    content
  end

end
