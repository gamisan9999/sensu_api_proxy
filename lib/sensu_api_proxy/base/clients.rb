class SensuAPIProxy::Base
  get "/clients" do
    begin
      call_api do |http|
        clients = JSON.load http.get("/clients").body
        intercept_clients(clients).to_json
      end
    rescue
      500
    end
  end

  def intercept_clients clients
    clients
  end
end
