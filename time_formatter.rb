class TimeFormatter
  VALID_FORMATS = %w(year month day hour minute second)

  def initialize(array)
    @format = array
    @valid = %w(year month day hour minute second)
  end

  def valid?
    (@format - VALID_FORMATS).empty?
  end

  def unknown_format
    @format - VALID_FORMATS
  end

  def convert_format
    @format.map! do |t|
      case t
      when "year"
        t = Time.now.year
      when "month"
        t = Time.now.month
      when "day"
        t = Time.now.day
      when "hour"
        t = Time.now.hour
      when "minute"
        t = Time.now.min
      when "second"
        t = Time.now.sec
      end
    end

    @format.join("-")
  end

  def return_format
    if valid?
      convert_format
    else
      unknown_format
    end
  end

end
