class TimeFormatter

  def initialize(array)
    @format = array
    @valid_format = %w(year month day hour minute second)
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

  def valid?
    (@format - @valid_format).empty?
  end

  def unknown_format
    @format - @valid_format
  end

  def return_format
    if valid?
      convert_format
    else
      unknown_format
    end
  end

end
