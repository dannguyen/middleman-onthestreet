# not to be confused with the image_tag helper
# that is often a part of Rails-like systems
# Creates an <img> tag and an optional div.caption tag
VALID_MEDIA_TYPES = [:youtube, :vimeo, :image]
def media_tag(url, opts = {})
  if opts[:media_type].present?
    if VALID_MEDIA_TYPES.any?(opts[:media_type])
      media_type = opts[:media_type]
    else
      raise StandardError, ":media_type must be #{VALID_MEDIA_TYPES}"
    end
  else
    media_type = case url
      when /youtube\.com\//
        :youtube
      when /vimeo\.com\//
        :vimeo
      else
        :image
    end
  end

  tag_foo = "#{media_type}_tag"
  content_tag(:div, :class => "mediawrap") do
    s = ActiveSupport::SafeBuffer.new
    s.safe_concat send(tag_foo, url, opts)
    s.safe_concat media_caption_tag(opts[:caption], opts) if opts[:caption]

    s
  end
end

# embeds a youtube clip
def youtube_tag(url, opts = {})
  # extract youtube thing
  m = url.match(/(?<=v=)[A-z0-9\-]+/)
  youtube_id = m.present? ? m[0] : url
  embed_url = "//www.youtube.com/embed/#{youtube_id}"

  content_tag(:iframe, "", :src => embed_url,
    :frameborder => opts[:frameborder],
    :allowfullscreen => true,
    :width => opts[:width] || "600",
    :height => opts[:height] || "480"
  )
end

# embeds a vimeo clip
def vimeo_tag(url, opts = {})
  # extract vimeo_id thing
#  m = url.match(/(?<=\/)\d{2,}(?=$|\/)/)
#  vimeo_id = m.present? ? m[0] : url
 vimeo_id = 36820781
  # "https://player.vimeo.com/video/999999"
  embed_url = "//player.vimeo.com/video/#{vimeo_id}"

  content_tag(:iframe, "", :src => embed_url,
    :frameborder => opts[:frameborder],
    :allowfullscreen => true,
    :width => opts[:width] || "600",
    :height => opts[:height] || "480"
  )
end

# Creates <div class="caption"></div> and renders markdown
# options:
#  source_url:
#     given a URL, creates markup for <a class="source" href="http://source.url">[Source]</a>
#     and appends it inline to the caption
def media_caption_tag(text = nil, opts = {})
  txt = text.to_s.strip
  if txt.blank? && opts[:source_url].blank?
    ""
  else
    if opts[:source_url]
      srcname = opts[:source_name].blank? ? "[Source]" : "[Source: #{opts[:source_name]}]"
      txt << %Q{ <a class="source" href="#{opts[:source_url]}">#{srcname}</a>}
    end
    mtxt = markdownify(txt)
    klass = opts[:class].blank? ? "caption media" : "caption media " + opts[:class]

    content_tag(:div, mtxt, :class => klass)
  end
end
