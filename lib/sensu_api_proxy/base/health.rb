# Proxy for health API
# http://sensuapp.org/docs/latest/api_health

class SensuAPIProxy::Base
  get "/health" do
    begin
      parameters = before_get_health(params) || params
      response   = call_api {|http| http.get "/health#{params_to_s parameters}"}
      pass_through response
      after_get_health response, load_response(response)
    rescue
      500
    end
  end

  def before_get_health parameters
  end

  def after_get_health response, health
  end
end
