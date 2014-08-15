# Proxy for clients API
# http://sensuapp.org/docs/latest/api_clients

class SensuAPIProxy::Base
  get "/clients" do
    begin
      call_api do |http|
        parameters = before_get_clients params
        request    = "/clients#{params_to_s parameters}"
        response   = http.get request
        clients    = load_response response

        after_get_clients(clients).to_json
      end
    rescue
      500
    end
  end

  def before_get_clients parameters
    parameters
  end

  def after_get_clients clients
    clients
  end

  get "/clients/:client" do
    begin
      call_api do |http|
        response = http.get "/clients/#{params[:client]}"
        client   = load_response response

        after_get_clients_client(client).to_json
      end
    rescue
      500
    end
  end

  def after_get_clients_client client
    client
  end

  delete "/clients/:client" do
    begin
      call_api do |http|
        response = http.delete "/clients/#{params[:client]}"
        response = after_delete_clients_client response

        [response.code.to_i, response.body]
      end
    rescue
      500
    end
  end

  def after_delete_clients_client response
    response
  end

  get "/clients/:client/history" do
    begin
      call_api do |http|
        response = http.get "/clients/#{params[:client]}/history"
        client   = load_response response

        after_get_clients_client_history(client).to_json
      end
    rescue
      500
    end
  end

  def after_get_clients_client_history history
    history
  end
end
