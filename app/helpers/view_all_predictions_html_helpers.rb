module ViewAllPredictionsHtmlHelpers
  # =====================================================================================
  # =============================   VIEW ALL PREDICTIONS   ==============================
  # =====================================================================================

  def set_view_all_predictions_page_html_list
    @html_list = {
        left_margin_div: {},
        view_all_predictions_div: {
            header_row_div: {
                team_header_div: {},
                user_div: {},
            },
            predictions_row_div: {
                team_names_div: {
                    home_team_div: {},
                    away_team_div: {}
                },
                predictions_div: {
                    home_prediction_div: {},
                    away_prediction_div: {}
                }
            },
        right_margin_div: {}
        }
    }
  end

  def set_view_all_predictions_page_html_list_detail
    @html_list_detail = {
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
        team_header_div: {
            tag: :div,
            args: { class: 'col-xs-6' },
            text: 'Team'
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
        home_team_div: {
            tag: :div,
            args: { class: 'row col-xs-12' },
            text: '@match##home_team'
        },
        away_team_div: {
            tag: :div,
            args: { class: 'row col-xs-12' },
            text: '@match##away_team'
        },
        predictions_div: {
            tag: :div,
            args: { class: 'col-xs-3' },
            loop: {
                each: '@match##predictions=>@prediction'
             }
        },
        home_prediction_div: {
            tag: :div,
            args: { class: 'row col-xs-12' },
            text: '@prediction##home_score'
        },
        away_prediction_div: {
            tag: :div,
            args: { class: 'row col-xs-12' },
            text: '@prediction##away_score'
        },
        right_margin_div: {
            tag: :div,
            args: { class: 'col-sm-4 col-xs-12' }
        }
    }
  end

end