module CustomHelpers
  def full_title(page_title=nil, site_title)
    page_title ||= ""
    if page_title.empty?
      site_title
    else
      page_title + " | " + site_title
    end
  end

  def smart_robots(path, env)
    # Add paths (like "thank you" pages) that search engines should not index.
    # Multiple paths look like this:
    # /first_path|another_path|yet_another/
    if !!(path =~ /thanks/) || env != "production"
      "noindex, nofollow"
    else
      "index, follow"
    end
  end

  # https://robots.thoughtbot.com/organized-workflow-for-svg
  # https://gist.github.com/bitmanic/0047ef8d7eaec0bf31bb
  def inline_svg(filename, options = {})
    root = Middleman::Application.root
    file_path = "#{root}/source/assets/images/#{filename}"
    if File.exists?(file_path)
      file = File.read(file_path).force_encoding("UTF-8")
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css "svg"
      if options[:class].present?
        svg["class"] = options[:class]
      end
      doc
    else
      "file not found: #{file_path}"
    end
  end

  def localized_path(path, in_locale, out_locale)
    in_locale = case in_locale
             when String
               in_locale.to_sym
             else
               in_locale
             end
    out_locale = case out_locale
             when String
               out_locale.to_sym
             else
               out_locale
             end
    
    translations = I18n.backend.send(:translations)
    current_key = translations[in_locale][:paths].select{|key, value| value == path}.map{|key, value| key }.first
    
    new_path = translations[out_locale][:paths][current_key]

    out_locale == I18n.default_locale ? "/#{new_path}" : "/#{out_locale}/#{new_path}" 
  end
end
