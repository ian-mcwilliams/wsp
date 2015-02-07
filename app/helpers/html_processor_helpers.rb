module HtmlProcessorHelpers

  def process_html_list(html_list)
    html_list.each do |key, value|
      @detail = @html_list_detail[key]
      @args = @detail[:args].merge(id: key.to_s)
      if @detail.has_key?(:each)
        get_items.each do |item|
          instance_variable_set("@#{@detail[:set]}", item) if @detail.has_key?(:set)
          write_html_tag(value)
        end
      else
        write_html_tag(value)
      end
    end
  end

  def get_items
    raw_data = instance_variable_get("@#{@detail[:each]}")
    items = []
    items.concat(raw_data) if raw_data.is_a?(Array)
    raw_data.each { |key, value| items << value.merge(key: key) } if raw_data.is_a?(Hash)
    items
  end

  def write_html_tag(value)
    process_html_list(value) unless value.empty?
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