module HtmlProcessorHelpers

  def process_html_list(html_list)
    puts '============================================================================================='
    puts '============================================================================================='
    puts '============================================================================================='
    verify_page_html_list_against_detail(html_list)
    @iterate = false
    output = execute_html_processing(html_list)
    puts '============================================================================================='
    puts '============================================================================================='
    puts '============================================================================================='
    output
  end

  def execute_html_processing(html_list, loop_id=nil)
    current_str = active_support_str
    html_list.each do |key, value|
      loop_id ? id = "#{loop_id}#{snake_to_camel(key.to_s, true)}" : id = snake_to_camel(key.to_s)
      @detail = @html_list_detail[key]
      if @detail.has_key?(:loop)
        @iterate ? top_level_iterator = false : top_level_iterator = true
        @iterate = true if top_level_iterator
        collection = get_items
        collection[:items].each_with_index do |item, index|
          current_id = "#{id}#{index}"
          instance_variable_set(collection[:subset], item) if collection.has_key?(:subset)
          current_str << build_html_str(current_id, value)
        end
        @iterate = false if top_level_iterator
      else
        current_str << build_html_str(id, value)
      end
    end
    current_str
  end

  def build_html_str(id, value)
    @args = nil
    id_hash = { id: id }
    @detail.has_key?(:args) ? @args = @detail[:args].merge(id_hash) : @args = id_hash
    process_text
    args, detail = {}, {}
    args.merge!(@args); detail.merge!(@detail)
    current_str = nil
    unless value.empty?
      @iterate ? current_str = execute_html_processing(value, id) : current_str = execute_html_processing(value)
    end
    @args = args; @detail = detail
    @args[:content] = current_str if current_str
    write_html_tag
  end

  def process_text
    @detail.has_key?(:text) ? text = @detail[:text] : text = nil
    if text
      if text.index('@') == 0
        split_text = text.split('##')
        text = instance_variable_get(split_text[0])
        text = text[split_text[1].to_sym] if split_text.count > 1
        @args[:text] = text
      else
        @args[:text] = text
      end
    end
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
    @keys = []
    hash.each do |key, value|
      @keys << key
      flatten_hash(value) unless value.empty?
    end
  end

  def get_items
    raw_data = @detail[:loop][:each]
    raw_data.index('=>') ? raw_data_arr = raw_data.split('=>') : raw_data_arr = [raw_data]
    if raw_data_arr[0].index('##')
      iterator = raw_data_arr[0].split('##')
      collection = instance_variable_get(iterator[0])[iterator[1].to_sym]
    else
      collection = instance_variable_get(raw_data_arr[0])
    end
    items = []
    items.concat(collection) if collection.is_a?(Array)
    collection.each { |key, value| items << value.merge(key: key) } if collection.is_a?(Hash)
    items = { items: items }
    items[:subset] = raw_data_arr[1] if raw_data_arr.count > 1
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