require 'ruby-calendarific'

class GetHolidays
  attr_accessor :year , :countries
  def initialize (year , countries)
    @year = year 
    @loc_codes = countries
  end

  def self.call (year, countries)
    GetHolidays.new(year, countries).all
  end

  def api
    Calendarific::V2.new()
  end
  
  def params(loc_code)
    {
      'year' => year,
      'api_key' =>  ENV['cal_token'],
      'country' => loc_code
    }
  end

  def holidays
    @loc_codes.map{|l| api.holidays(params(l))['response']['holidays']}
              .flatten
  end

  def all
    holidays.each{|t| Holiday.create(mk_holiday(t))}
  end

  def mk_states(states)
    return states if states == "All"
    states.map{|s| s['abbrev'] }.join(',')
  end

  def mk_types(types)
    types.map{|t| HolidayType.find_or_create_by(name: t)}
  end

  def mk_holiday(holiday)
    params = {
      name: holiday['name'] ,
      description: holiday['description'] ,
      country: holiday['country']['id'].upcase ,
      holiday_date: Date.new(
        holiday['date']['datetime']['year'] ,
        holiday['date']['datetime']['month'] ,
        holiday['date']['datetime']['day']
      ) ,
      states: mk_states(holiday['states']) ,
      holiday_types: mk_types(holiday['type'])
    }
  end

end
