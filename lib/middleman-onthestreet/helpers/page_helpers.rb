module Onthestreet
  module Helpers
    def meta_title
      default_title = config[:site_title]
      the_title = ""
      ptitle = current_page.data.title
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
      current_page.data.description || config[:site_description]
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
