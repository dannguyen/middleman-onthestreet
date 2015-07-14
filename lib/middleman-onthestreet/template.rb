require 'middleman-core/templates'

module Middleman
  module Onthestreet

    class Template < Middleman::Templates::Base

      def self.source_root
        File.join(File.dirname(__FILE__), 'template')
      end

      def build_scaffold!
        template 'shared/Gemfile.tt', File.join(location, 'Gemfile')
        template 'shared/config.tt', File.join(location, 'config.rb')
        copy_file 'source/index.html.erb', File.join(location, 'source/index.html.erb')
        copy_file 'source/layouts/layout.erb', File.join(location, 'source/layouts/layout.erb')

        empty_directory File.join(location, 'source', options[:css_dir])
        copy_file 'source/stylesheets/all.css', File.join(location, 'source', options[:css_dir], 'all.css')
        copy_file 'source/stylesheets/normalize.css', File.join(location, 'source', options[:css_dir], 'normalize.css')
        replace_images_dir

        empty_directory File.join(location, 'source', options[:js_dir])
        copy_file 'source/javascripts/all.js', File.join(location, 'source', options[:js_dir], 'all.js')

        empty_directory File.join(location, 'source', options[:images_dir])
        copy_file 'source/images/background.png', File.join(location, 'source', options[:images_dir], 'background.png')
        copy_file 'source/images/middleman.png', File.join(location, 'source', options[:images_dir], 'middleman.png')
        copy_file 'source/images/favicon.ico', File.join(location, 'source', options[:images_dir], 'favicon.ico')

      end

    end
  end
end
