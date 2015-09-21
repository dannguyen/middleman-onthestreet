module Onthestreet
  module Helpers
    def markdownify(str)
      Kramdown::Document.new(str.to_s).to_html
    end

    # resource has a url and/or title
    def link_to_resource(obj, opts = {})
      if obj.is_a?(Hash)
        obj = ActiveSupport::HashWithIndifferentAccess.new(obj)
        url = obj[:url]
        title = obj[:title] || url
      else
        url = obj.url
        title = obj.title || url
      end

      return link_to(title, url, opts)
    end


    # adds bootstrap container div
    def container_tag(tagname = :div, content = nil, opts = {}, &block)
      opts[:class] = (opts[:class].to_s + " container").strip
      content_tag(tagname, opts, &block)
    end


    # add some code
    def codepiece(file_path, opts = {})
      display_class = opts[:display_class] || "short"
      # determine language
      lang = opts[:lang] || case File.extname(file_path)
      when /rb/   ; 'ruby'
      when /py$/  ; 'python'
      when /sh$/  ; 'shell'
      when /html/ ; 'html'
      when /xml/  ;  'xml'
      when /css/  ;  'css'
      when /json/ ;  'json'
      when /yaml/ ;  'yaml'
      else
        nil
      end

      content = FooFileHacks.get_raw_content_from_file(file_path, sitemap)
      partial "/layouts/onthestreet/partials/snippets/codepiece",
                  locals: { content: content, display_class: display_class, lang: lang, path: file_path}
    end


    module FooFileHacks
      # hacky!
      # was having trouble with getting files in /code
      def self.get_raw_content_from_file(path, sitemap)
        if contains_leading_underscore?(path)
          # attempt absolute path
          z = File.expand_path(path, sitemap.app.source_dir)
          File.read(z)
        else
          sitemap.find_resource_by_path(path).render
        end
      end

      def self.contains_leading_underscore?(path)
        path.to_s.split('/').any?{|p| p =~ /^_/ }
      end
    end

  end
end
