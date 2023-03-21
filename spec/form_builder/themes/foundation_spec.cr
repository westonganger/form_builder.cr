require "../../spec_helper"
require "./theme_spec_helper"

theme_klass = FormBuilder::Themes::Foundation
theme = theme_klass.new

describe theme_klass do

  describe ".theme_name" do
    it "is correct" do
      theme_klass.theme_name.should eq("foundation")
    end
  end

  describe ".wrap_field" do
    it "works" do

    end
  end

  describe "FormBuilder.form" do
    it "matches docs example with labels" do
      expected = String.build do |str|
        str << %(<form method="post">)
          str << %(<div>)
            str << %(<label for="email">Email)
            str << %(<input type="text" name="email" id="email">)
            str << "</label>"
          str << "</div>"

          str << %(<div>)
            str << %(<label for="password">Password)
            str << %(<input type="password" name="password" id="password">)
            str << "</label>"
          str << "</div>"

          str << %(<div>)
            str << %(<input type="checkbox" name="remember_me" id="remember_me">)
            str << %(<label for="remember_me">Remember Me</label>)
          str << "</div>"

          str << %(<button type="submit">Sign in</button>)
        str <<%(</form>)
      end

      actual = FormBuilder.form(theme: theme_klass.theme_name) do |f|
        f << f.field(type: :text, name: :email)
        f << f.field(type: :password, name: :password)
        f << f.field(type: :checkbox, name: :remember_me)
        f << %(<button type="submit">Sign in</button>)
      end

      actual.should eq(expected)
    end
  end

  describe ".form_html_attributes" do
    it "returns correct attributes" do
      attrs = StringHash.new

      theme.form_html_attributes(html_attrs: StringHash.new).should eq(attrs)
    end
  end

  TESTED_FIELD_TYPES.each do |field_type|
    describe ".input_html_attributes" do
      it "returns correct #{field_type} attributes" do
        attrs = StringHash.new

        theme.input_html_attributes(html_attrs: StringHash.new, field_type: field_type, has_errors?: false).should eq(attrs)
      end
    end

    describe ".label_html_attributes" do
      it "returns correct #{field_type} attributes" do
        attrs = StringHash.new

        theme.label_html_attributes(html_attrs: StringHash.new, field_type: field_type, has_errors?: false).should eq(attrs)
      end
    end

    describe ".build_html_help_text" do
      it "returns correct #{field_type} attributes" do
        expected = "<p class=\"help-text\">foobar</p>"

        attrs = StringHash.new

        theme.build_html_help_text(html_attrs: attrs, field_type: field_type, help_text: "foobar").should eq(expected)
      end
    end

    describe ".build_html_error" do
      it "returns correct #{field_type} attributes" do
        expected = "<span class=\"form-error\">foobar</span>"

        attrs = StringHash.new

        theme.build_html_error(html_attrs: attrs, field_type: field_type, error: "foobar").should eq(expected)
      end
    end
  end

end
