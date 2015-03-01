module NewGameweekHtmlHelpers

  # =====================================================================================
  # ============================   NEW GAMEWEEK FORM   ==================================
  # =====================================================================================

  def get_new_gameweek_page_html_list
    {
        new_gameweek_form_div: {
            cut_off_div: {
                cut_off_text_div: {},
                cut_off_details_div: {
                    cut_off_date_div: {
                        cut_off_date_text_div: {},
                        cut_off_date_input_div: {
                            cut_off_date_input: {}
                        }
                    },
                    cut_off_time_div: {
                        cut_off_time_text_div: {
                            cut_off_time_div: {},
                            cut_off_time_input_div: {
                                cut_off_time_input: {}
                            }
                        }
                    }
                }
            },
            match_param_div: {
                matches_title_div: {},
                set_matches_div: {
                    set_match_div: {
                        set_match_info_div: {
                            set_match_top_row_div: {
                                set_match_date_div: {
                                    set_match_date_text_div: {},
                                    set_match_date_input_div: {
                                        set_match_date_input: {}
                                    }
                                },
                                set_home_team_div: {
                                    set_home_team_text_div: {},
                                    set_home_team_input_div: {
                                        set_home_team_input: {}
                                    }
                                }
                            },
                            set_match_bottom_row_div: {
                                set_match_time_div: {
                                    set_match_time_text_div: {},
                                    set_match_time_input_div: {
                                        set_match_time_input: {}
                                    }
                                },
                                set_away_team_div: {
                                    sat_away_team_text_div: {},
                                    set_away_team_input_div: {
                                        set_away_team_input: {}
                                    }
                                }
                            }
                        },
                        remove_match_button_div: {
                            remove_match_button: {}
                        }
                    }
                }
            },
            button_div: {
                add_match_div: {
                    add_match_input: {}
                },
                submit_match_div: {
                    submit_match_input: {}
                }
            }
        }
    }
  end

  def get_new_gameweek_page_html_list_detail
    {}
  end

end