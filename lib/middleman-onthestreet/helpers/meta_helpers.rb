module Onthestreet
  module Helpers
    def meta_title
      default_title = config[:site_title]
      the_title = ""
      ptitle = page_title
      if ptitle.blank?
        the_title = default_title
      else
        if ptitle != default_title
          the_title = "#{ptitle} | #{default_title}"
        else
          the_title = default_title
        end
      end

      return the_title
    end


    def meta_description
      page_description|| config[:site_description]
    end

    def meta_author
      page_author || config[:site_author]
    end

    def meta_image_url
      if page_image
        page_image.url
      else
        site_image_url
      end
    end

    def meta_image_caption
      page_image.caption if page_image
    end

    def meta_url
      URI.join site_baseurl, current_page.url
    end
  end
end
