class EscapeFacade
  def initialize(params, location)
    @params = params
    @location = location
  end 

  def climb_options
    results = EscapeService.new.get_climb_results(@params, @location)
    results.map do |result|
      if @params.key?(:trad) && @params.key?(:sport) && (result[:type] == "Trad" || result[:type] == "Sport" || result[:type] == "Sport, TR")
        ClimbOptions.new(result)
      elsif !@params.key?(:trad) && !@params.key?(:sport) && (result[:type] == "Trad" || result[:type] == "Sport" || result[:type] == "Sport, TR")
        ClimbOptions.new(result)
      elsif @params.key?(:trad) && result[:type] == "Trad"
        ClimbOptions.new(result)
      elsif @params.key?(:sport) && (result[:type] == "Sport" || result[:type] == "Sport, TR")
        ClimbOptions.new(result)
      end
    end.compact
  end
end