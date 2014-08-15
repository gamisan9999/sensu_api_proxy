require "sensu_api_proxy"

class SensuAPIProxy::Example < SensuAPIProxy::Base
  ### example: filter clients by name ###

  def after_get_clients response, clients
    clients.select {|client| client["name"].match /example/}

    body clients.to_json
  end

  ### all methods listed below ###

  # # Do something around Aggregates APIs

  # def before_get_aggregates parameters
  # end

  # def after_get_aggregates response, aggregates
  # end

  # def before_get_aggregates_check parameters
  # end

  # def after_get_aggregates_check response, aggregates
  # end

  # def after_delete_aggregates_check response
  # end

  # def before_get_aggregates_check_issued parameters
  # end

  # def after_get_aggregates_check_issued response, aggregate
  # end

  # # Do something around Checks APIs

  # def after_get_checks response, checks
  # end

  # def after_get_checks_check response, check
  # end

  # def before_post_request payload
  # end

  # def after_post_request response
  # end

  # # Do something around Clients APIs

  # def before_get_clients parameters
  # end

  # def after_get_clients response, clients
  # end

  # def after_get_clients_client response, client
  # end

  # def after_delete_clients_client response
  # end

  # def after_get_clients_client_history response, history
  # end

  # # Do something around Events APIs

  # def after_get_events response, events
  # end

  # def after_get_events_client response, events
  # end

  # def after_get_events_client_check response, event
  # end

  # def after_delete_events_client_check response
  # end

  # def before_post_resolve payload
  # end

  # def after_post_resolve response
  # end

  # # Do something around Health APIs

  # def before_get_health parameters
  # end

  # def after_get_health response, health
  # end

  # # Do something around Info APIs

  # def after_get_info response, info
  # end

  # # Do something around Stashes APIs

  # def before_get_stashes parameters
  # end

  # def after_get_stashes response, stashes
  # end

  # def before_post_stashes payload
  # end

  # def after_post_stashes response
  # end

  # def after_get_stashes_path response, stashes
  # end

  # def before_post_stashes_path payload
  # end

  # def after_post_stashes_path response
  # end

  # def after_delete_stashes_path response
  # end
end
