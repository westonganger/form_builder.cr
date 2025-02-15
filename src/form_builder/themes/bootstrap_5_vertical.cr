module FormBuilder
  module Themes
    class Bootstrap5Vertical < BaseTheme
      include Bootstrap5Base

      def self.theme_name
        "bootstrap_5_vertical"
      end

      def wrap_field(field_type : String, html_field : String, html_label : String?, html_help_text : String?, html_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          if ["checkbox", "radio"].includes?(field_type)
            wrapper_html_attributes["class"] = "form-check #{wrapper_html_attributes["class"]?}".strip
          end

          s << FormBuilder.build_html_element(:div, wrapper_html_attributes)

          if ["checkbox", "radio"].includes?(field_type)
            s << "#{html_field}"
            s << "#{html_label}"
          else
            s << "#{html_label}"
            s << "#{html_field}"
          end
          s << "#{html_help_text}"
          s << html_errors.join if html_errors

          s << "</div>"
        end
      end

    end
  end
end
