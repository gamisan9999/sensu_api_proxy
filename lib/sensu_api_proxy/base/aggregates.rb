# Proxy for aggregates API
# http://sensuapp.org/docs/latest/api_aggregates

class SensuAPIProxy::Base
  get "/aggregates" do
    begin
      call_api do |http|
        parameters = before_get_aggregates(params) || params
        response   = http.get "/aggregates#{params_to_s parameters}"
        pass_through response
        after_get_aggregates response, load_response(response)
      end
    rescue
      500
    end
  end

  def before_get_aggregates parameters
  end

  def after_get_aggregates response, aggregates
  end

  get "/aggregates/:check" do
    begin
      call_api do |http|
        parameters = before_get_aggregates_check(params) || params
        response   = http.get "/aggregates/#{params[:check]}"
        pass_through response
        after_get_aggregates_check response, load_response(response)
      end
    rescue
      500
    end
  end

  def before_get_aggregates_check parameters
  end

  def after_get_aggregates_check response, aggregates
  end

  delete "/aggregates/:check" do
    begin
      call_api do |http|
        response = http.delete "/aggregates/#{params[:check]}"
        pass_through response
        after_delete_aggregates_check response, load_response(response)
      end
    rescue
      500
    end
  end

  def after_delete_aggregates_check response, deletion
  end

  get "/aggregates/:check/:issued" do
    begin
      call_api do |http|
        parameters = before_get_aggregates_check_issued(params) || params
        response   = http.get "/aggregates/#{params[:check]}/#{params[:issued]}#{params_to_s parameters}"
        pass_through response
        after_get_aggregates_check_issued response, load_response(response)
      end
    rescue
      500
    end
  end

  def before_get_aggregates_check_issued parameters
  end

  def after_get_aggregates_check_issued response, aggregate
  end
end
