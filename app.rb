require_relative 'time_formatter'

class App

  def call(env)
    @request = Rack::Request.new(env)
    @response = Rack::Response.new
    request_time_user
    @response
  end

  private

  def request_time_user
    case @request.path
    when  "/time"
      handler_time_request_user
    else
      not_found
    end
  end

  def handler_time_request_user
    user_format = Rack::Utils.parse_nested_query(@request.query_string).values.join.split(",")
    time_formatter = TimeFormatter.new(user_format)

    if time_formatter.valid?
      @response.status = 200
      @response.write("#{time_formatter.return_format}")
    else
      @response.status(400)
      @response.write("Unknown time format #{time_formatter.return_format}")
    end
  end

  def not_found
    @response.status = 404
    @response.write("Not found")
  end

  def headers
    @response.headers({ 'Content-Type' => 'text/plain' })
  end

end
