class Api::V1::ParentSessionsController < Api::V1::BaseController
  def create
    parent = Parent.find_by_email(params[:email])
    if parent && parent.valid_password?(params[:password])
      parent.add_client_application(current_client_application)
      render :json => {:error => false, :parent => {:id => parent.id, :authentication_token => parent.authentication_token}}
    else
      render :json => {:error => true}
    end
  end
end
