class FfcrmApi::ApplicationController < ActionController::Base
  def require_login
    unless params[:single_access_token] && User.find_by_single_access_token(params[:single_access_token])
      head 400
      render :nothing => true
    end
  end
end
