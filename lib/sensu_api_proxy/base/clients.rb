# Proxy for clients API
# http://sensuapp.org/docs/latest/api_clients

class SensuAPIProxy::Base
  get "/clients" do
    begin
      call_api do |http|
        parameters = before_get_clients(params) || params
        response   = http.get "/clients#{params_to_s parameters}"
        pass_through response
        after_get_clients response, load_response(response)
      end
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
      call_api do |http|
        response = http.get "/clients/#{params[:client]}"
        pass_through response
        after_get_clients_client response, load_response(response)
      end
    rescue
      500
    end
  end

  def after_get_clients_client response, client
  end

  delete "/clients/:client" do
    begin
      call_api do |http|
        response = http.delete "/clients/#{params[:client]}"
        pass_through response
        after_delete_clients_client response, load_response(response)
      end
    rescue
      500
    end
  end

  def after_delete_clients_client response, deletion
  end

  get "/clients/:client/history" do
    begin
      call_api do |http|
        response = http.get "/clients/#{params[:client]}/history"
        pass_through response
        after_get_clients_client_history response, load_response(response)
      end
    rescue
      500
    end
  end

  def after_get_clients_client_history response, history
  end
end
