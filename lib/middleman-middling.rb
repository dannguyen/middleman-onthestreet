# Require core library
require 'middleman-core'

# Extension namespace
class MiddlingExtension < ::Middleman::Extension
  MIDDLING_CONFIG = "./_middling.yaml"

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
    app.set :css_dir, 'assets/stylesheets'
    app.set :js_dir, 'assets/javascripts'
    app.set :images_dir, 'assets/images'
    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
  end


  helpers do
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

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

MyExtension.register(:middling_extension)
