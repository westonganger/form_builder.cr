require "../../spec_helper"
require "./theme_spec_helper"

describe FormBuilder::Themes::BaseTheme do

  describe ".theme_name" do
    it "works by default" do
      FormBuilder::Themes::BaseTheme.theme_name.should eq("base_theme")
    end

    it "works with custom" do
      FormBuilder::Themes::Bootstrap4Inline.theme_name.should eq("bootstrap_4_inline")
    end
  end

end
