class Api::V1::ClientApplicationsController < Api::V1::BaseController
  before_filter :parent_required
  before_filter :child_required

  def sync
    render :json => current_client_application.time_summary(current_parent, current_child).merge(:error => false)
  end
end