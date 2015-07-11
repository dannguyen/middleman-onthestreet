# Require core library
require 'middleman-core'
require 'helpers/onthestreet_helpers'
# Extension namespace
class OnthestreetExtension < ::Middleman::Extension
  ONTHESTREET_CONFIG = "./_onthestreet.yaml"

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
    app.set :css_dir, 'assets/stylesheets'
    app.set :js_dir, 'assets/javascripts'
    app.set :images_dir, 'assets/images'

    site_config =  ActiveSupport::HashWithIndifferentAccess.new(YAML.load_file(ONTHESTREET_CONFIG))
    site_config[:site].each_pair do |att, val|
      app.set :"site_#{att}", val
    end

    # set up services
    app.set :services, site_config[:services]


    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
  end


  helpers do
    include Onthestreet::Helpers

  end
end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

OnthestreetExtension.register(:onthestreet_extension)
