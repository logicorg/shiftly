require 'active_support/core_ext'

module Shiftly
  class Config
    DEFAULT_CONFIG = {
      day_start_hour:   6,
      shift_hours:      8,
      number_of_shifts: 3
    }

    class << self
      private

      def config
        Thread.main[:shiftly_config] ||= default_config
      end

      def config=(config)
        Thread.main[:shiftly_config] = config
      end

      def threadsafe_cattr_accessor(name)
        define_singleton_method name do
          config[name]
        end
        define_singleton_method "#{name}=" do |value|
          config[name] = value
        end
      end
    end

    threadsafe_cattr_accessor :day_start_hour

    threadsafe_cattr_accessor :shift_hours

    threadsafe_cattr_accessor :number_of_shifts

    class << self
      def load(file)
        reset
        data = YAML::load(file.respond_to?(:read) ? file : File.open(file))
        config = (data['shiftly'] || {})

        config_vars = %w(beginning_of_factory_day shift_length number_of_shifts)
        config_vars.each do |var|
          send("#{var}=", config[var]) if config[var] && respond_to?("#{var}=")
        end
      end

      def default_config
        deep_dup(DEFAULT_CONFIG)
      end

      private

      def reset
        self.config = default_config
      end

      def deep_dup(object)
        Marshal.load(Marshal.dump(object))
      end
    end

    reset
  end
end