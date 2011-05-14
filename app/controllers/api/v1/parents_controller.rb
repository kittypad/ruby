class Api::V1::ParentsController < Api::V1::BaseController
  def create
    parent = Parent.new(params[:parent])
    if parent.save
      parent.add_client_application(current_client_application)
      render :json => {:error => false, :parent => {:id => parent.id, :authentication_token => parent.authentication_token}}
    else
      render :json => {:error => true, :messages => parent.errors.full_messages}
    end
  end
end
