require "octopress-return-tag/version"
require "octopress-tag-helpers"
require "jekyll"

module Octopress
  module Tags
    module ReturnTag
      class Tag < Liquid::Tag
        def initialize(tag_name, markup, tokens)
          @markup = markup.strip
          super
        end

        def render(context)
          return unless markup = TagHelpers::Conditional.parse(@markup, context)

          TagHelpers::Var.get_value(markup, context)
        end
      end
    end
  end
end

Liquid::Template.register_tag('return', Octopress::Tags::ReturnTag::Tag)

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Return Tag",
    description: "Render Liquid variables with conditions and filters.",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    type:        "tag",
    source_url:  "https://github.com/octopress/return-tag",
    version:     Octopress::Tags::ReturnTag::VERSION
  })
end

