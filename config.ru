$:.unshift File.dirname __FILE__

require "sensu_api_proxy"

run SensuAPIProxy::Server::Base
