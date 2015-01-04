module TestTwoAppHelper

  def get_predict_match_html(match)
    content = content_tag(:div,
                get_predict_team_item(match[:home_team][:name]),
                class: 'predictTeam')
    content + content_tag(:div,
                get_predict_team_item(match[:away_team][:name]),
                class: 'predictTeam')
  end

  def get_predict_team_item(team_name)
    content = content_tag(:div,
                team_name,
                class: 'predictTeamItem teamName')
    content + content_tag(:div,
                text_field_tag(team_name.downcase.gsub(' ', '_').to_sym, nil, class: 'inputBox'),
                class: 'predictTeamItem')
  end

  def get_predict_matches_html
    content = ActiveSupport::SafeBuffer.new('')
    @matches.each do |match|
      content << content_tag(:div,
         get_predict_match_html(match),
         class: 'predictMatch')
    end
    content
  end

end

