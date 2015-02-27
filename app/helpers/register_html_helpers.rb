module RegisterHtmlHelpers

  # =====================================================================================
  # =============================   REGISTRATION FORM   =================================
  # =====================================================================================

  def get_register_page_html
    set_register_page_html_list
    set_register_page_html_list_detail
    @current_page_html_content_str = process_html_list(@html_list)
  end

  def set_register_page_html_list
    @html_list = {}
  end

  def set_register_page_html_list_detail
    @html_list_detail = {}
  end

end