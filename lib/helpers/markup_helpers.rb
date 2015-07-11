module Middling
  module Helpers
    def markdownify(str)
      Kramdown::Document.new(str.to_s).to_html
    end
  end
end
