class Station

  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_times

  def initialize(data)
    @name          = data[:name]
    @address       = data[:address]
    @fuel_typ      = data[:fuel_type]
    @distance      = data[:distance]
    @access_times  = data[:access_times]
  end
end
