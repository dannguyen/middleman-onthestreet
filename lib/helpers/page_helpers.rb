module Middling
  module Helpers
      def page_title
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


      def page_description
        current_page.data.description || config[:site_description]
      end

      def page_author
        current_page.data.author || config[:site_author]
      end

      def page_image_url
        current_page.data.image.url if current_page.data.image
      end

      def page_image_caption
        current_page.data.image.caption if current_page.data.image
      end
  end
end
