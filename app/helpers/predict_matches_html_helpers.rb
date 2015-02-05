module PredictMatchesHtmlHelpers
  # =====================================================================================
  # =============================   PREDICT MATCHES FORM   ==============================
  # =====================================================================================

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
