class Length
  include Comparable
  attr_reader :value, :unit

  CONVERSION_FACTOR = {
    km: { km: 1, mi: 0.6213711, nmi: 0.539957 },
    mi: { km: 1.609344, mi: 1, nmi: 0.8689762419 },
    nmi: { km: 1.8519993, mi: 1.15078, nmi: 1 }
  }.freeze

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km)
  end

  def as_miles
    convert_to(:mi)
  end

  def as_nautical_miles
    convert_to(:nmi)
  end

  def <=>(other)
    return value <=> other.value if unit == other.unit
    value <=> other.convert_to(unit).value
  end

  def -(other)
    return Length.new((value - other.value), unit) if unit == other.unit
    raise ArgumentError, "Length object arithmitic requires common units"
  end

  def +(other)
    return Length.new((value + other.value), unit) if unit == other.unit
    raise ArgumentError, "Length object arithmitic requires common units"
  end

  def to_s
    "#{value} #{unit}"
  end

  protected

  def convert_to(target_unit)
    Length.new((value / CONVERSION_FACTOR[unit][target_unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

diff = (Length.new(10, :km).as_nautical_miles.as_kilometers - Length.new(10, :km)).value.abs 

p diff < 0.001 # => true

sum = Length.new(10, :mi) + Length.new(10, :nmi) # => ArgumentError

# => I chose not to implement implicit conversion for arithmitic
# => I think it's better to preform the conversion seperatley.
# => Implicit conversion could be confusing as to which units the return value
# => should have.
