module ViewPredictionsHtmlHelpers
  # =====================================================================================
  # =============================   VIEW PREDICTIONS   ==================================
  # =====================================================================================

  def get_view_predictions_page_html_list
    {
        left_margin_div: {},
        view_all_predictions_div: {
            header_row_div: {
                team_header_text: {},
                user_div: {},
            },
            predictions_row_div: {
                team_names_div: {
                    home_team_text: {},
                    away_team_text: {}
                },
                predictions_div: {
                    home_prediction_text: {},
                    away_prediction_text: {}
                }
            },
            right_margin_div: {}
        }
    }
  end

  def get_view_predictions_page_html_list_detail
    {
        left_margin_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12'}
        },
        view_all_predictions_div: {
            tag: :div,
            args: { class: 'row col-sm-4 col-xs-12' }
        },
        header_row_div: {
            tag: :div,
            args: { class: 'row' }
        },
        team_header_text: {
            text: 'Team',
            div: { args: { class: 'col-xs-6' } }
        },
        user_div: {
            tag: :div,
            text: '@user',
            args: { class: 'col-xs-3' },
            loop: {
                each: '@view_all_predictions##users=>@user'
            }
        },
        predictions_row_div: {
            tag: :div,
            args: { class: 'row' },
            loop: {
                each: '@view_all_predictions##matches=>@match'
            }
        },
        team_names_div: {
            tag: :div,
            args: { class: 'col-xs-6' },
        },
        home_team_text: {
            text: '@match##home_team',
            div: { args: { class: 'row col-xs-12' } }
        },
        away_team_text: {
            text: '@match##away_team',
            div: { args: { class: 'row col-xs-12' } }
        },
        predictions_div: {
            tag: :div,
            args: { class: 'col-xs-3' },
            loop: {
                each: '@match##predictions=>@prediction'
             }
        },
        home_prediction_text: {
            text: '@prediction##home_score',
            div: { args: { class: 'row col-xs-12' } }
        },
        away_prediction_text: {
            text: '@prediction##away_score',
            div: { args: { class: 'row col-xs-12' } }
        },
        right_margin_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12' }
        }
    }
  end

end