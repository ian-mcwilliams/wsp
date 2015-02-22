module PageFrameHelpers

  # =====================================================================================
  # =============================   PAGE HEADER   =======================================
  # =====================================================================================


  def get_header_html
    set_header_html_list
    set_header_html_list_detail
    @current_page_html_content_str = process_html_list(@html_list)
  end

  def set_header_html_list
    @html_list = {
        header_div: {}
    }
  end

  def set_header_html_list_detail
    @html_list_detail = {
        header_div: {
            tag: :div,
            args: { class: 'row col-xs-12 h1' },
            text: '@current_page_title'
        }
    }
  end


  # =====================================================================================
  # =============================   PAGE FOOTER   =======================================
  # =====================================================================================


  def get_footer_html
    set_footer_html_list
    set_footer_html_list_detail
    @current_page_html_content_str = process_html_list(@html_list)
  end

  def set_footer_html_list
    @html_list = {
        footer_div: {}
    }
  end

  def set_footer_html_list_detail
    @html_list_detail = {
        footer_div: {
            tag: :div,
            args: { class: 'row col-xs-12' },
            text: 'Have Fun!'
        }
    }
  end


end

