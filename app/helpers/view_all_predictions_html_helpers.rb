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
            tag: :div
        },
        header_row_div: {
            tag: :div
        },
        all_predictions_div: {
            tag: :div
        },
        user_div: {
            tag: :div
        },
        predictions_row_div: {
            tag: :div
        },
        team_names_div: {
            tag: :div
        },
        home_team_div: {
            tag: :div
        },
        away_team_div: {
            tag: :div
        },
        predictions_div: {
            tag: :div
        },
        home_prediction_div: {
            tag: :div
        },
        away_prediction_div: {
            tag: :div
        }
    }
  end

end