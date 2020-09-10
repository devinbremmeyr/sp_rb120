=begin
NOTES:
  make a new class Noble
  nobility have the gait: strut
  nobilty have names and tittles
=end

module Walkable # requires a #name and #gait method
  def walk
    "#{name} #{gait} forward"
  end
end 

class Noble
  include Walkable
  attr_reader :name, :tittle
  
  def initialize(name, tittle)
    @name = name
    @tittle = tittle
  end

  def walk
    "#{tittle} #{super}"
  end
  
  private

  def gait
    'struts'
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
p byron.name
p byron.tittle
