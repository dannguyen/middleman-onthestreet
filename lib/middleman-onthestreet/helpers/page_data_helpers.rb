# just a set of conventions
# e.g. page_title vs. current_page.title
module Onthestreet
  module Helpers

    # for dynamic pages, we expect the option :dynamic_page has been set
    def _dynamic_page
      opts = current_page.metadata[:options]

      return opts[:dynamic_page] || {}
    end

    def page_title
      current_page.data.title || _dynamic_page[:title]
    end

    def page_description
      current_page.data.description || _dynamic_page[:description]
    end

    def page_author
      current_page.data.author || _dynamic_page[:author] ||  config[:site_author]
    end

    def page_image_url
      img = current_page.data.image || _dynamic_page[:image]
      if img
        return img.url
      elsif (img_url = current_page.data.image_url || _dynamic_page[:image_url])
        return img_url
      end
    end

    def page_image_caption
      current_page.data.image.caption if current_page.data.image
    end

    def page_url
      URI.join site_baseurl, current_page.url
    end

  end
end
