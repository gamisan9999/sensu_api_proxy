# Proxy for info API
# http://sensuapp.org/docs/latest/api_info

class SensuAPIProxy::Base
  get "/info" do
    begin
      call_api do |http|
        response = http.get "/info"
        pass_through response
        after_get_info response, load_response(response)
      end
    rescue
      500
    end
  end

  def after_get_info response, info
  end
end
