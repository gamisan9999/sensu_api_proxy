# coding: utf-8

require "sinatra/base"
require "json"
require "net/http"

class SensuAPIProxy::Base < Sinatra::Base
  configure :development do
    require "sinatra/reloader"
    register Sinatra::Reloader
  end

  helpers do
    def sensu_api_host
      ENV["SENSU_API_HOST"] || "localhost"
    end

    def sensu_api_port
      ENV["SENSU_API_PORT"] || 4567
    end

    def call_api
      Net::HTTP.start sensu_api_host, sensu_api_port do |http|
        yield http
      end
    end
  end

  error do
  end
end
