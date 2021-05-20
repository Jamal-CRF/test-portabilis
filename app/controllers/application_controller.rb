class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit


private

  def user_not_authorized
    flash[:notice] = "Você não tem permissão para fazer esta ação :("
    redirect_to(request.referrer || root_path) 
  end
end
