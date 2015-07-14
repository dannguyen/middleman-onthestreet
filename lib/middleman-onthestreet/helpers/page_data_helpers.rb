# just a set of conventions
# e.g. page_title vs. current_page.title
module Onthestreet
  module Helpers

    def page_title
      current_page.data.title
    end

    def page_description
      current_page.data.description
    end

    def meta_author
      current_page.data.author || config[:site_author]
    end

    def meta_image_url
      if current_page.data.image
        current_page.data.image.url
      else
        site_image_url
      end
    end

    def meta_image_caption
      current_page.data.image.caption if current_page.data.image
    end

    def meta_url
      URI.join site_baseurl, current_page.url
    end

  end
end
