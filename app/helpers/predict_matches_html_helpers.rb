module PredictMatchesHtmlHelpers

  # =====================================================================================
  # =============================   PREDICT MATCHES FORM   ==============================
  # =====================================================================================

  def get_predict_matches_page_html_list
    {
        left_margin_div: {},
        predict_match_form: {
            predict_match_div: {
                predict_match_team_div: {
                    predict_match_team_text: {},
                    predict_match_team_input: {}
                }
            },
            predict_match_form_submit: {}
        },
        right_margin_div: {}
    }
  end

  def get_predict_matches_page_html_list_detail
    {
        left_margin_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12'}
        },
        predict_match_form: {
            tag: :form,
            args: { controller: 'test_two_app', action: 'predict_matches', method: 'post' },
            div: { args: { class: 'col-sm-4 col-xs-12' } }
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
        predict_match_team_text: {
            text: '@team##name',
            div: { args: { class: 'col-xs-6 testDiv4' } }
        },
        predict_match_team_input: {
            tag: :input,
            args: { class: 'testDiv2', style: 'width:32px' },
            name: '@team##key',
            div: { args: { class: 'col-xs-6' } }
        },
        predict_match_form_submit: {
            tag: :submit,
            args: { class: 'btn-primary btn-lg' },
            value: 'Predict',
            div: { args: { class: 'row' } }
        },
        right_margin_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12' }
        }
    }
  end

end
