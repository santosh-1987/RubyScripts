require 'singleton'

class AppConfig
  include Singleton
  attr_accessor :data

  def version
    '1.0.0'
  end
end

AppConfig.instance.data = {enabled: true}
puts AppConfig.instance.data

#AppConfig.new  #=> Throws Error