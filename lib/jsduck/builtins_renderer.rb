require 'jsduck/builtins_registry'

module JsDuck

  # Performs the rendering of builtin tags (for now just the signature data).
  class BuiltinsRenderer
    # Renders tags of a particular section.
    #
    # Returns array of rendered HTML or nil if no meta data.
    def self.render(html_data, position)
      return if html_data.size == 0

      BuiltinsRegistry.get_html_renderers(position).map do |tag|
        html_data[tag.key]
      end
    end

    # Renders the signatures for a class member.
    # Returns a string.
    def self.render_signature(member)
      html = []
      BuiltinsRegistry.signatures.each do |s|
        if member[s[:key]]
          title = s[:tooltip] ? "title='#{s[:tooltip]}'" : ""
          html << "<strong class='#{s[:key]} signature' #{title}>#{s[:long]}</strong>"
        end
      end
      html.join
    end

  end

end