# Proxy for clients API
# http://sensuapp.org/docs/latest/api_clients

class SensuAPIProxy::Base
  get "/clients" do
    begin
      parameters = before_get_clients(params) || params
      response   = call_api {|http| http.get "/clients#{params_to_s parameters}"}
      pass_through response
      after_get_clients response, load_response(response)
    rescue
      500
    end
  end

  def before_get_clients parameters
  end

  def after_get_clients response, clients
  end

  get "/clients/:client" do
    begin
      response = call_api {|http| http.get "/clients/#{params[:client]}"}
      pass_through response
      after_get_clients_client response, load_response(response)
    rescue
      500
    end
  end

  def after_get_clients_client response, client
  end

  delete "/clients/:client" do
    begin
      response = call_api {|http| http.delete "/clients/#{params[:client]}"}
      pass_through response
      after_delete_clients_client response
    rescue
      500
    end
  end

  def after_delete_clients_client response
  end

  get "/clients/:client/history" do
    begin
      response = call_api {|http| http.get "/clients/#{params[:client]}/history"}
      pass_through response
      after_get_clients_client_history response, load_response(response)
    rescue
      500
    end
  end

  def after_get_clients_client_history response, history
  end
end
