module HtmlProcessorHelpers

  def process_html_list(html_list)
    html_list.each do |key, value|
      @detail = @html_list_detail[key]
      @args = @detail[:args].merge(id: key.to_s)
      if @detail.has_key?(:each)
        instance_variable_get("@#{@detail[:each]}").each { |key, value| write_html_tag(value) }
      else
        write_html_tag(value)
      end
    end
  end

  def write_html_tag(value)
    unless value.empty?
      process_html_list(value)
    end
    send("create_#{@detail[:tag].to_s}")
  end

  def create_div(content=nil)
    content_tag(:div, content, @args)
  end

  def create_form(content)
    html_id = @args.delete(:id)
    form_tag(@args, html_id) { content }
  end

  def create_input(content=nil)
    text_field_tag('', content, @args)
  end

  def create_submit
    submit_tag(@detail[:value], @args)
  end

  def create_email
    email_field(:user, :email, @args)
  end

  def create_password_field_tag
    password_field(:password, @args)
  end

end