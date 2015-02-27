module EnterScoresHtmlHelpers

  # =====================================================================================
  # ==============================   ENTER SCORES FORM   ================================
  # =====================================================================================

  def get_enter_scores_page_html
    set_enter_scores_page_html_list
    set_enter_scores_page_html_list_detail
    @current_page_html_content_str = process_html_list(@html_list)
  end

  def set_enter_scores_page_html_list
    @html_list = {}
  end


  def set_enter_scores_page_html_list_detail
    @html_list_detail = {}
  end

end