class ShiftlyConfigGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.template('shiftly.rb', "config/initializers/shiftly.rb")
      m.template('shiftly.yml', "config/shiftly.yml")
    end
  end
end