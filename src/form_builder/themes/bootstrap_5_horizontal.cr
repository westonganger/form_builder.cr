module FormBuilder
  module Themes
    class Bootstrap5Horizontal < BaseTheme
      include Bootstrap5Base

      def self.theme_name
        "bootstrap_5_horizontal"
      end

      def initialize(@column_classes : Array(String) = ["col-sm-3", "col-sm-9"])
        @column_classes = @column_classes.first(2)
        @offset_class = (i = @column_classes[0].index(/-\d/)) ? @column_classes[0].insert(i+1, "offset-") : ""
      end

      def wrap_field(field_type : String, html_field : String, html_label : String?, html_help_text : String?, html_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          s << FormBuilder.build_html_element(:div, wrapper_html_attributes)

          if ["checkbox", "radio"].includes?(field_type)
            s << %(<div class="row">)

            s << %(<div class="#{@column_classes[0]}"></div>)

            s << %(<div class="#{@column_classes[1]}">)
            s << %(<div class="form-check">)
            s << "#{html_field}"
            s << "#{html_label}"
            s << "#{html_help_text}"
            s << html_errors.join if html_errors
            s << "</div>"
            s << "</div>"

            s << "</div>"
          else
            s << %(<div class="row">)

            s << %(<div class="#{@column_classes[0]}">)
            s << "#{html_label}"
            s << "</div>"

            s << %(<div class="#{@column_classes[1]}">)
            s << "#{html_field}"
            s << "#{html_help_text}"
            s << html_errors.join if html_errors
            s << "</div>"

            s << "</div>"
          end

          s << "</div>"
        end
      end

    end
  end
end
