module ViewAllPredictionsHtmlHelpers
  # =====================================================================================
  # =============================   VIEW ALL PREDICTIONS   ==============================
  # =====================================================================================

  def get_view_all_predictions_page_html
    set_view_all_predictions_page_html_list
    set_view_all_predictions_page_html_list_detail
    @current_page_html_content_str = process_html_list(@html_list)
  end

  def set_view_all_predictions_page_html_list
    @html_list = {
        view_all_predictions_div: {
            header_row_div: {
                all_predictions_div: {},
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
            }
        }
    }
  end

  def set_view_all_predictions_page_html_list_detail
    @html_list_detail = {
        view_all_predictions_div: {
            tag: :div,
            args: { class: 'viewAllPredictionsDiv' }
        },
        header_row_div: {
            tag: :div,
            args: { class: 'headerRowDiv' }
        },
        all_predictions_div: {
            tag: :div,
            args: { class: 'allPredictionsDiv' },
            text: 'All Predictions'
        },
        user_div: {
            tag: :div,
            text: '@user',
            args: { class: 'userDiv' },
            loop: {
                each: '@view_all_predictions##users=>@user'
            }
        },
        predictions_row_div: {
            tag: :div,
            args: { class: 'predictionsRowDiv' },
            loop: {
                each: '@view_all_predictions##matches=>@match'
            }
        },
        team_names_div: {
            tag: :div,
            args: { class: 'teamNamesDiv' },
        },
        home_team_div: {
            tag: :div,
            args: { class: 'homeTeamDiv' },
            text: '@match##home_team'
        },
        away_team_div: {
            tag: :div,
            args: { class: 'awayTeamDiv' },
            text: '@match##away_team'
        },
        predictions_div: {
            tag: :div,
            args: { class: 'predictionsDiv' },
            loop: {
                each: '@match##predictions=>@prediction'
            }
        },
        home_prediction_div: {
            tag: :div,
            args: { class: 'homePredictionDiv' },
            text: '@prediction##home_score'
        },
        away_prediction_div: {
            tag: :div,
            args: { class: 'awayPredictionDiv' },
            text: '@prediction##away_score'
        }
    }
  end

end