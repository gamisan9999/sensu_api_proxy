# Proxy for checks API
# http://sensuapp.org/docs/latest/api_checks

class SensuAPIProxy::Base
  get "/checks" do
    begin
      response = call_api {|http| http.get "/checks"}
      pass_through response
      after_get_checks response, load_response(response)
    rescue
      500
    end
  end

  def after_get_checks response, checks
  end

  get "/checks/:check" do
    begin
      response = call_api {|http| http.get "/checks/#{params[:check]}"}
      pass_through response
      after_get_checks_check response, load_response(response)
    rescue
      500
    end
  end

  def after_get_checks_check response, check
  end

  post "/request" do
    begin
      payload  = before_post_request(read_payload) || read_payload
      response = call_api {|http| http.post "/request", payload}
      pass_through response
      after_post_request response
    rescue
      500
    end
  end

  def before_post_request payload
  end

  def after_post_request response
  end
end
