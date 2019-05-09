class InfoController < ActionController::API

  def get
    render json: '{"usefulInfo": "Cool"}', status: :ok
  end
end