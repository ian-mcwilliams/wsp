module HtmlProcessorHelpers

  def process_html_list(html_list)
    verify_page_html_list_against_detail(html_list)
    execute_html_processing(html_list)
  end

  def execute_html_processing(html_list)
    current_str = active_support_str
    html_list.each do |key, value|
      @detail = @html_list_detail[key]
      puts "*********************>>> key = #{key}"
      if @detail.has_key?(:loop)
        puts 'HAS LOOP!'
        collection = get_items
        collection[:items].each do |item|
          instance_variable_set(collection[:subset], item) if collection.has_key?(:subset)
          current_str << build_html_str(key, value)
        end
      else
        current_str << build_html_str(key, value)
      end
    end
    current_str
  end

  def build_html_str(key, value)
    @args = nil
    id_hash = { id: snake_to_camel(key.to_s) }
    @detail.has_key?(:args) ? @args = @detail[:args].merge(id_hash) : @args = id_hash
    args, detail = {}, {}
    args.merge!(@args); detail.merge!(@detail)
    current_str = nil
    current_str = execute_html_processing(value) unless value.empty?
    @args = args; @detail = detail
    @args[:content] = current_str if current_str
    write_html_tag
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
    puts "@detail[:loop][:each] = #{@detail[:loop][:each]}"
    raw_data = @detail[:loop][:each]
    puts "raw_data = #{raw_data}"
    raw_data.index('=>') ? raw_data_arr = raw_data.split('=>') : raw_data_arr = [raw_data]
    collection = instance_variable_get(raw_data_arr[0])
    items = []
    items.concat(collection) if collection.is_a?(Array)
    collection.each { |key, value| items << value.merge(key: key) } if collection.is_a?(Hash)
    items = { items: items }
    items[:subset] = raw_data_arr[1] if raw_data_arr.count > 0
    items
  end

  def write_html_tag
    send("create_#{@detail[:tag].to_s}", @args)
  end

  def create_div(args)
    content = args.delete(:content)
    content ||= args.delete(:text)
    content_tag(:div, content, args)
  end

  def create_form(args)
    content = args.delete(:content)
    html_id = { id: args.delete(:id) }
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