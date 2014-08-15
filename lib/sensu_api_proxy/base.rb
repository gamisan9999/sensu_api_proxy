# coding: utf-8

require "sinatra/base"
require "net/http"
require "multi_json"

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

    def halt_if_not_ok response
      code = response.code.to_i

      unless (200..209).include? code
        pass_through response
        halt
      end
    end

    def load_response response
      halt_if_not_ok response
      MultiJson.load response.body
    end

    def params_to_s hash
      return "" if hash.empty?
      hash.inject("?") {|string, (key, value)| string + "#{key}=#{value}&"}.chop
    end

    def read_payload
      env["rack.input"].read
    end

    def pass_through response
      status  response.code.to_i
      headers response.header.to_hash
      body    response.body
    end
  end

  error do
  end
end
