class Admin::BeatsController < AdminController

  before_filter :authorize_user

  def index
    @pending_beats = Beat.pending
    @approved_beats = Beat.approved
    @rejected_beats = Beat.rejected
  end

  def new
    @beat = Beat.new
  end

  def create
    @beat = Beat.new(params[:beat])
    if @beat.save
      redirect_to admin_beats_path, notice: 'Successfully uploaded beat'
    else
      render 'new'
    end
  end

  def edit
    @beat = Beat.find(params[:id])
  end

  def update
    @beat = Beat.find(params[:id])
    if @beat.update_attributes(params[:beat])
      redirect_to admin_beats_path, notice: 'Successfully uploaded beat'
    else
      redirect_to edit_admin_beat_path(@beat)
    end
  end

  def approve
    @beat = Beat.find(params[:id])
    @beat.approve
    redirect_to :back
  end

  def reject
    @beat = Beat.find(params[:id])
    @beat.reject
    redirect_to :back
  end

  def reset
    @beat = Beat.find(params[:id])
    @beat.reset
    redirect_to :back
  end

  protected

  def authorize_user
    redirect_to root_path, notice: 'You are not authorized!' unless current_user && current_user.is_admin?
  end

end
