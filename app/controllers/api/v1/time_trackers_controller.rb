class Api::V1::TimeTrackersController < Api::BaseController
  before_filter :player_required

  def create
    time = TimeTracker.played_time(current_player, params)
    time_tracker = current_player.time_trackers.build(:time => time, :app => current_app, :timestamp => params[:timestamp])
    if time_tracker.save
      current_player.update_attributes(:time_to_pause => params[:time_to_pause], :time_to_break => params[:time_to_break], :time_left => params[:time_left], :timestamp => params[:timestamp])
      render :json => {:error => false}
    else
      render :json => {:error => true, :messages => time_tracker.errors.full_messages}
    end
  end
end
