# Proxy for events API
# http://sensuapp.org/docs/latest/api_events

class SensuAPIProxy::Base
  get "/events" do
    begin
      response = call_api {|http| http.get "/events"}
      pass_through response
      after_get_events response, load_response(response)
    rescue
      500
    end
  end

  def after_get_events response, events
  end

  get "/events/:client" do
    begin
      response = call_api {|http| http.get "/events/#{params[:client]}"}
      pass_through response
      after_get_events_client response, load_response(response)
    rescue
      500
    end
  end

  def after_get_events_client response, events
  end

  get "/events/:client/:check" do
    begin
      response = call_api {|http| http.get "/events/#{params[:client]}/#{params[:check]}"}
      pass_through response
      after_get_events_client_check response, load_response(response)
    rescue
      500
    end
  end

  def after_get_events_client_check response, event
  end

  delete "/events/:client/:check" do
    begin
      response = call_api {|http| http.delete "/events/#{params[:client]}/#{params[:check]}"}
      pass_through response
      after_delete_events_client_check response
    rescue
      500
    end
  end

  def after_delete_events_client_check response
  end

  post "/resolve" do
    begin
      payload  = before_post_resolve(read_payload) || read_payload
      response = call_api {|http| http.post "/post", payload}
      pass_through response
      after_post_resolve response
    rescue
      500
    end
  end

  def before_post_resolve payload
  end

  def after_post_resolve response
  end
end
