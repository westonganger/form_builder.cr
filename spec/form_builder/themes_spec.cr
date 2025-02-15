require "../spec_helper"

theme = FormBuilder::Themes::Bootstrap4Inline

describe FormBuilder::Themes do

  describe ".classes" do
    it "Comes with default themes" do
      classes = [FormBuilder::Themes::Bootstrap2Horizontal, FormBuilder::Themes::Bootstrap2Inline, FormBuilder::Themes::Bootstrap2Vertical, FormBuilder::Themes::Bootstrap3Horizontal, FormBuilder::Themes::Bootstrap3Inline, FormBuilder::Themes::Bootstrap3Vertical, FormBuilder::Themes::Bootstrap4Horizontal, FormBuilder::Themes::Bootstrap4Inline, FormBuilder::Themes::Bootstrap4Vertical, FormBuilder::Themes::Bootstrap5Horizontal, FormBuilder::Themes::Bootstrap5Inline, FormBuilder::Themes::Bootstrap5Vertical, FormBuilder::Themes::BulmaHorizontal, FormBuilder::Themes::BulmaVertical, FormBuilder::Themes::Default, FormBuilder::Themes::Foundation, FormBuilder::Themes::Materialize, FormBuilder::Themes::Milligram, FormBuilder::Themes::SemanticUIInline, FormBuilder::Themes::SemanticUIVertical]

      FormBuilder::Themes.classes.should eq(classes)

      expected = ["bootstrap_2_horizontal", "bootstrap_2_inline", "bootstrap_2_vertical", "bootstrap_3_horizontal", "bootstrap_3_inline", "bootstrap_3_vertical", "bootstrap_4_horizontal", "bootstrap_4_inline", "bootstrap_4_vertical", "bootstrap_5_horizontal", "bootstrap_5_inline", "bootstrap_5_vertical", "bulma_horizontal", "bulma_vertical", "default", "foundation", "materialize", "milligram", "semantic_ui_inline", "semantic_ui_vertical"]

      classes.map{|x| x.theme_name}.should eq(expected)
    end
  end

  describe ".from_name" do
    it "works correctly" do
      FormBuilder::Themes.from_name("bootstrap_4_inline").should eq(theme)
    end

    it "fails correctly" do
      expect_raises(ArgumentError) do
        FormBuilder::Themes.from_name("invalid_theme")
      end
    end
  end

  describe "Kitchen Sink" do
    FormBuilder::Themes.classes.each do |theme_class|
      b = FormBuilder::Builder.new(theme: theme_class.new)

      TESTED_FIELD_TYPES.each do |field_type|
        it "theme: #{theme_class.name}, field_type: #{field_type}" do
          if field_type == "select"
            actual = b.field type: :select, name: :foobar, label: "Hello", help_text: "World", errors: ["error1", "error2"], input_html: {class: "foo"}, label_html: {class: "foo"}, wrapper_html: {class: "foo"}, help_text_html: {class: "foo"}, error_html: {class: "foo"}, collection: {options: [["foo", "bar"], "foobar"], selected: "foobar", disabled: "other", include_blank: true}
          else
            actual = b.field type: field_type, name: :foobar, label: "Hello", help_text: "World", value: "foo", errors: ["error1", "error2"], input_html: {class: "foo"}, label_html: {class: "foo"}, wrapper_html: {class: "foo"}, help_text_html: {class: "foo"}, error_html: {class: "foo"}
          end

          ### Ensure No Incorrect/Unparenthesized Ternary Values
          actual.includes?("true").should eq(false)
          actual.includes?("false").should eq(false)
        end
      end
    end
  end

end
