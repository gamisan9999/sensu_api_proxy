require "sensu_api_proxy"

class SensuAPIProxy::Example < SensuAPIProxy::Base
  # Returns clients with name start with "example", instead of all clients.
  def after_get_clients clients
    clients.select {|client| client["name"].start_with? "example"}
  end

  # def before_get_clients parameters
  #   parameters
  # end

  # def after_get_clients clients
  #   clients
  # end

  # def after_get_clients_client client
  #   client
  # end

  # def after_delete_clients_client response
  #   response
  # end

  # def after_get_clients_client_history history
  #   history
  # end
end
