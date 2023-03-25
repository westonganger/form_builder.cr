module FormBuilder
  module Themes
    class Bootstrap5Inline < BaseTheme
      include Bootstrap5Base

      def self.theme_name
        "bootstrap_5_inline"
      end

      def wrap_field(field_type : String, html_field : String, html_label : String?, html_help_text : String?, html_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          if ["checkbox", "radio"].includes?(field_type)
            wrapper_html_attributes["class"] = "col-auto form-check #{wrapper_html_attributes["class"]?}".strip

            s << FormBuilder.build_html_element(:div, wrapper_html_attributes)
            s << html_field
            s << html_label
          else
            s << %(<div class="col-auto">#{html_label}</div>)
            s << %(<div class="col-auto">)
            s << html_field
          end

          s << "#{html_help_text}"
          s << html_errors.join if html_errors
          s << "</div>"
        end
      end

      def form_html_attributes(html_attrs : StringHash)
        html_attrs["class"] = "row #{html_attrs["class"]?}".strip
        html_attrs
      end

    end
  end
end
