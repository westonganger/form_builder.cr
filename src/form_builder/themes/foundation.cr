module FormBuilder
  class Themes
    class Foundation < Themes

      def wrap_field(field_type : String, html_label : String?, html_field : String, field_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          attr_str = build_html_attr_string(wrapper_html_attributes)
          s << "#{attr_str.empty? ? "<div>" : %(<div #{attr_str}>)}"

          if !{"checkbox", "radio"}.includes?(field_type) && html_label
            s << html_label.sub("</label>", "#{html_field}</label>")
          else
            s << html_field
            s << html_label
          end

          s << "</div>"
        end
      end

      def input_html_attributes(html_attrs : StringHash, field_type : String)
        html_attrs
      end

      def label_html_attributes(html_attrs : StringHash, field_type : String)
        html_attrs
      end

      def form_html_attributes(html_attrs : StringHash)
        html_attrs
      end

    end
  end
end