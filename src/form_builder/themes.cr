module FormBuilder
  module Themes

    def self.classes
      {{FormBuilder::Themes::BaseTheme.subclasses}}
    end

    def self.from_name(name : String)
      classes.each do |klass|
        if klass.theme_name == name
          return klass
        end
      end

      raise ArgumentError.new("FormBuilder theme `#{name}` was not found")
    end

  end
end
