require 'date'

class Date
  def self.yesterday
    self.today - 1
  end
end

class DateTime
  def start_of_day
    change(:hour => 0, :min => 0)
  end

  def start_of_month
    change(:day => 1, :hour => 0, :min => 0)
  end

  def start_of_week
    days_to_monday = self.wday!=0 ? self.wday-1 : 6
    result = self - days_to_monday
    result.start_of_day
  end

  def to_date
    ::Date.new(year, month, day)
  end

  def to_hour
    change(:min => 0, :sec => 0)
  end

  def change(options)
    ::DateTime.civil(options[:year]  || year,
      options[:month] || month,
      options[:day]   || day,
      options[:hour]  || hour,
      options[:min]   || (options[:hour] ? 0 : min),
      options[:sec]   || ((options[:hour] || options[:min]) ? 0 : sec),
      options[:offset]  || offset,
      options[:start]  || start)
  end
end

class Time
  def web
    self.strftime("%b %d %H:%M")
  end
  
  def to_hour
    change(:min => 0, :sec => 0)
  end
  
  def change(options)
    ::Time.new(options[:year]  || year,
      options[:month] || month,
      options[:day]   || day,
      options[:hour]  || hour,
      options[:min]   || (options[:hour] ? 0 : min),
      options[:sec]   || ((options[:hour] || options[:min]) ? 0 : sec),
      options[:utc_offset]  || utc_offset)
  end
end

class String
  def truncate(len=50)
    self.size > len ? "#{self[0, len]}&hellip;" : self
  end
end