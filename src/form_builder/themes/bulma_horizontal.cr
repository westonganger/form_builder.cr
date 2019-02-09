module FormBuilder
  class Themes
    class BulmaHorizontal < Themes

      def wrap_field(field_type : String, html_label : String?, html_field : String, field_errors : Array(String)?, wrapper_html_attributes : StringHash)
        String.build do |s|
          if {"checkbox", "radio"}.includes?(field_type) && html_label && (i = html_label.index(">"))
            s << "#{html_label.insert(i+1, "#{html_field} ")}"
          else
            s << html_label
            s << html_field
          end
        end
      end

      def input_html_attributes(html_attrs : StringHash, field_type : String)
        html_attrs
      end

      def label_html_attributes(html_attrs : StringHash, field_type : String)
        if {"checkbox", "radio"}.includes?(field_type)
          html_attrs["class"] = "#{html_attrs["class"]?} #{field_type}".strip
        end

        html_attrs
      end

      def form_html_attributes(html_attrs : StringHash)
        html_attrs["class"] = "#{html_attrs["class"]?} form-inline".strip
        html_attrs
      end

    end
  end
end