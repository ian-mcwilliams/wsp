require 'htmlbeautifier'
# require 'awesome_print'

module TestTwoAppHelper

  def active_support_str(str='')
    ActiveSupport::SafeBuffer.new(str)
  end

  def prepare_html_str(str)
    active_support_str(HtmlBeautifier.beautify(str))
  end

  def snake_to_camel(str, capitalise_first_letter=false)
    camel = ''
    split_str = str.split('_')
    capitalise_first_letter ? start_index = -1 : start_index = 0
    split_str.each_with_index do |current_str, index|
      index > start_index ? camel_str = current_str.titleize : camel_str = current_str
      camel << camel_str
    end
    camel
  end

  def get_page_html(page_name)
    @current_page_html_content_str = ''
    @html_list = send("set_#{page_name}_page_html_list")
    @html_list_detail = send("set_#{page_name}_page_html_list_detail")
    @current_page_html_content_str = process_html_list(@html_list)
    prepare_html_str(@current_page_html_content_str)
  end

  def get_form_input_html(text, input)
    content = content_tag(:div,
                          text,
                          class: 'formText')
    content + content_tag(:div,
                          input,
                          class: 'formInput')
  end

  def get_page_frame_html
    prepare_html_str(content_tag(:h1, @current_page_title, id: 'header'))
  end

end

