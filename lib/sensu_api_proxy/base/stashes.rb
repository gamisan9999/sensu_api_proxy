# Proxy for stashs API
# http://sensuapp.org/docs/latest/api_stashs

class SensuAPIProxy::Base
  get "/stashes" do
    begin
      parameters = before_get_stashes(params) || params
      response   = call_api {|http| http.get "/stashes#{params_to_s parameters}"}
      pass_through response
      after_get_stashes response, load_response(response)
    rescue
      500
    end
  end

  def before_get_stashes parameters
  end

  def after_get_stashes response, stashes
  end

  post "/stashes" do
    begin
      payload  = before_post_stashes(read_payload) || read_payload
      response = call_api {|http| http.post "/stashes", payload}
      pass_through response
      after_post_stashes response
    rescue => ex
      500
    end
  end

  def before_post_stashes payload
  end

  def after_post_stashes response
  end

  get "/stashs/:path" do
    begin
      response = call_api {|http| http.get "/stashs/#{params[:path]}"}
      pass_through response
      after_get_stashes_path response, load_response(response)
    rescue
      500
    end
  end

  def after_get_stashes_path response, stashes
  end

  post "/stashs/:path" do
    begin
      payload  = before_post_stashes_path(read_payload) || read_payload
      response = call_api {|http| http.post "/stashs/#{params[:path]}", payload}
      pass_through response
      after_post_stashes_path response
    rescue
      500
    end
  end

  def before_post_stashes_path payload
  end

  def after_post_stashes_path response
  end

  delete "/stashs/silence/:path" do
    begin
      response = call_api {|http| http.delete "/stashs/silence/#{params[:path]}"}
      pass_through response
      after_delete_stashes_path response
    rescue
      500
    end
  end

  def after_delete_stashes_path response
  end
end
