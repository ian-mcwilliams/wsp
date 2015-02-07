module HtmlProcessorHelpers

  def process_html_list(html_list)
    verify_page_html_list_against_detail(html_list)
    html_list.each do |key, value|
      @detail = @html_list_detail[key]
      puts '*********************'
      puts "key = #{key}"
      puts '*********************'
      pp @args
      puts '---'
      pp @detail
      @detail.has_key?(:args) ? @args = @detail[:args].merge(id: value.to_s) : @args = {id: value.to_s}
      current_str = get_current_html_content_str(value) unless value.empty?
      @args[:content] = current_str if current_str
      current_str = write_html_tag
      puts ">>>>>>>> pre-concat current_str = #{current_str}"
      add_to_full_str(current_str)
    end
    @full_str
  end

  def add_to_full_str(current_str)
    @full_str ||= active_support_str
    # puts '************************************************************************************************'
    # puts '************************************************************************************************'
    # puts "current_full_str = #{@full_str}"
    # puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    # puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    @full_str << current_str
    # puts '************************************************************************************************'
    # puts '************************************************************************************************'
    # puts "new_full_str = #{@full_str}"
    # puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    # puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
  end

  def get_current_html_content_str(current_list)
    current_html_content_str = active_support_str
    if @detail.has_key?(:each)
      get_items.each do |item|
        instance_variable_set(@detail[:set], item) if @detail.has_key?(:set)
        current_html_content_str << process_html_list(current_list)
      end
    else
      current_html_content_str << process_html_list(current_list)
    end
    current_html_content_str
  end

  def verify_page_html_list_against_detail(html_list)
    errors_found = []
    flatten_hash(html_list)
    @keys.each do |key|
      errors_found << key unless @html_list_detail.has_key?(key)
    end
    raise("keys in page_list not found in detail: #{errors_found.inspect}") unless errors_found.empty?
  end

  def flatten_hash(hash)
    @keys ||= []
    hash.each do |key, value|
      @keys << key
      flatten_hash(value) unless value.empty?
    end
  end

  def get_items
    raw_data = instance_variable_get("@#{@detail[:each]}")
    items = []
    items.concat(raw_data) if raw_data.is_a?(Array)
    raw_data.each { |key, value| items << value.merge(key: key) } if raw_data.is_a?(Hash)
    items
  end

  def write_html_tag
    send("create_#{@detail[:tag].to_s}", @args)
  end

  def create_div(args)
    content = args.delete(:content)
    content_tag(:div, content, args)
  end

  def create_form(args)
    content = args.delete(:content)
    html_id = args.delete(:id)
    form_tag(args, html_id) { content }
  end

  def create_input(args)
    content = args.delete(:content)
    text_field_tag('', content, args)
  end

  def create_submit(args)
    submit_tag(@detail[:value], args)
  end

  def create_email(args)
    email_field(:user, :email, args)
  end

  def create_password_field_tag(args)
    password_field(:password, args)
  end

end