module Shiftly
  module Generators
    class ConfigGenerator < Rails::Generators::Base # :nodoc:

      def self.gem_root
        File.expand_path("../../..", __FILE__)
      end

      def self.source_root
        # Use the templates from the 2.3.x generator
        File.join(gem_root, 'rails_generators', 'templates')
      end

      def generate
        template 'shiftly.rb', File.join('config', 'initializers', 'shiftly.rb')
        template 'shiftly.yml', File.join('config', 'shiftly.yml')
      end

    end
  end
end