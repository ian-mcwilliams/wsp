module ViewAllPredictionsHtmlHelpers
  # =====================================================================================
  # =============================   VIEW ALL PREDICTIONS   ==============================
  # =====================================================================================

  def set_view_all_predictions_html_list
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
            args: { class: 'viewAllPredictionsDiv' },
            tag: :div
        },
        header_row_div: {
            tag: :div,
            args: { class: 'headerRowDiv' }
        },
        all_predictions_div: {
            tag: :div,
            text: 'All Predictions',
            args: { class: 'allPredictionsDiv' }
        },
        user_div: {
            tag: :div,
            text: '@user##name',
            args: { class: 'userDiv' },
            loop: {
                each: '@user'
            }
        },
        predictions_row_div: {
            tag: :div,
            args: { class: 'predictionsRowDiv' },
            loop: {
                each: '@predictions'
            }
        },
        team_names_div: {
            tag: :div,
            args: { class: 'teamNamesDiv' },
            loop: {
                each: '@team##name'
            }
        },
        home_team_div: {
            tag: :div,
            args: { class: 'homeTeamDiv' },
            text: '@home##name'
        },
        away_team_div: {
            tag: :div,
            args: { class: 'awayTeamDiv' },
            text: '@away##name'
        },
        predictions_div: {
            tag: :div,
            args: { class: 'predictionsDiv' },
            loop: {
                each: '@predictions'
            }
        },
        home_prediction_div: {
            tag: :div,
            args: { class: 'homePredictionDiv' },
            text: '@home##prediction'
        },
        away_prediction_div: {
            tag: :div,
            args: { class: 'awayPredictionDiv' },
            text: '@away##prediction'
        }
    }
  end

end