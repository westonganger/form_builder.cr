require "../../spec_helper"
require "./theme_spec_helper"

base_klass = FormBuilder::Themes::Bootstrap5Base
theme_klass = FormBuilder::Themes::Bootstrap5Horizontal
theme = theme_klass.new

describe theme_klass do

  describe ".theme_name" do
    it "is not a valid theme" do
      (base_klass < FormBuilder::Themes::BaseTheme).should eq(false)
      expect_raises(ArgumentError){ FormBuilder.form(theme: base_klass.name.underscore) }
    end
  end

  describe "form_html_attributes" do
    it "returns correct attributes" do
      attrs = StringHash.new

      theme.form_html_attributes(html_attrs: StringHash.new).should eq(attrs)
    end
  end

  TESTED_FIELD_TYPES.each do |field_type|
    describe "input_html_attributes" do
      it "returns correct #{field_type} attributes" do
        attrs = StringHash.new

        case field_type
        when "checkbox", "radio"
          attrs["class"] = "form-check-input"
        when "select"
          attrs["class"] = "form-select"
        else
          attrs["class"] = "form-control"
        end

        theme.input_html_attributes(html_attrs: StringHash.new, field_type: field_type, has_errors?: false).should eq(attrs)
      end
    end

    describe "label_html_attributes" do
      it "returns correct #{field_type} attributes" do
        attrs = StringHash.new

        if {"checkbox", "radio"}.includes?(field_type)
          attrs["class"] = "form-check-label"
        end

        theme.label_html_attributes(html_attrs: StringHash.new, field_type: field_type, has_errors?: false).should eq(attrs)
      end
    end

    describe "build_html_help_text" do
      it "returns correct #{field_type} attributes" do
        expected = %(<small class="form-text" style="display:block;">foobar</small>)

        attrs = StringHash.new

        theme.build_html_help_text(html_attrs: attrs, field_type: field_type, help_text: "foobar").should eq(expected)
      end
    end

    describe "build_html_error" do
      it "returns correct #{field_type} attributes" do
        expected = "<div class=\"invalid-feedback\">foobar</div>"

        attrs = StringHash.new

        theme.build_html_error(html_attrs: attrs, field_type: field_type, error: "foobar").should eq(expected)
      end
    end
  end

end
