module NewGameweekHtmlHelpers

  # =====================================================================================
  # ============================   NEW GAMEWEEK FORM   ==================================
  # =====================================================================================

  def get_new_gameweek_page_html_list
    {
        new_gameweek_form: {
            cut_off_div: {
                cut_off_text: {},
                cut_off_details_div: {
                    cut_off_date_div: {
                        cut_off_date_text: {},
                        cut_off_date_input: {}
                    },
                    cut_off_time_div: {
                        cut_off_time_text: {},
                        cut_off_time_input: {}
                    }
                }
            },
            match_param_div: {
                matches_title: {},
                set_matches_div: {
                    set_match_div: {
                        set_match_info_div: {
                            set_match_top_row_div: {
                                set_match_date_div: {
                                    set_match_date_text: {},
                                    set_match_date_input: {}
                                },
                                set_home_team_div: {
                                    set_home_team_text: {},
                                    set_home_team_input: {}
                                }
                            },
                            set_match_bottom_row_div: {
                                set_match_time_div: {
                                    set_match_time_text: {},
                                    set_match_time_input: {}
                                },
                                set_away_team_div: {
                                    set_away_team_text: {},
                                    set_away_team_input: {}
                                }
                            }
                        },
                        remove_match_button: {}
                    }
                }
            },
            buttons_div: {
                add_match_input: {},
                submit_match_input: {}
            }
        }
    }
  end

  def get_new_gameweek_page_html_list_detail
    {}
  end

end