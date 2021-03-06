class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :destroy]

  before_filter :authorize_user, only: [:new]
  before_filter :authorize_editor, only: [:edit, :destroy]

  def authorize_user
    unless current_user.right == "company" or current_user.right == "administrator" 
      redirect_to root_path, :notice => 'You are not authorized'
    end
  end

  def authorize_editor
    @userid = Event.find_by_slug!(params[:id]).user_id
    unless current_user.id == @userid.to_i
      redirect_to root_path, :notice => "It's not your content"
    end
  end

  def like
    Like.where(user_id: current_user.id, event_id: params[:evid]).destroy_all
    Like.create(user_id: current_user.id, event_id: params[:evid], status: 'Like')
    @liked_event = Event.find_by_id(params[:evid])
    @liked_event.update_attributes(:like_count => Like.where(event_id: params[:evid], status: 'Like').count - Like.where(event_id: params[:evid], status: 'Dislike').count)
    @events = Event.all
    redirect_to events_path
  end

  def dislike
    Like.where(user_id: current_user.id, event_id: params[:evid]).destroy_all
    Like.create(user_id: current_user.id, event_id: params[:evid], status: 'Dislike')
    @liked_event = Event.find_by_id(params[:evid])
    @liked_event.update_attributes(:like_count => Like.where(event_id: params[:evid], status: 'Like').count - Like.where(event_id: params[:evid], status: 'Dislike').count)
    @events = Event.all
    redirect_to events_path
  end

  # GET /events
  # GET /events.json
  def index
    @search = Sunspot.search Event do 
    fulltext params[:event_search]
    end
    @events = Event.where(id: @search.results.map(&:id), published: "published").sorted(params[:sort], "created_at DESC").page(params[:page]).per(4) 
    @news = News.all.order("created_at DESC").limit(4)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @events = Event.find_by_slug!(params[:id])
    @news = News.all.order("created_at DESC").limit(4)
  end

  # GET /events/new
  def new
    @event = Event.new
    @places = Place.all
  end

  # GET /events/1/edit
  def edit
    @places = Place.all
  end

  # POST /events
  # POST /events.json
  def create
    @places = Place.all
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @curplace = Place.find_by(id: params[:event][:place_id])
    @user = User.all
    if current_user.id == @curplace.user_id
      @event.published = 'published'
    else
      @event.published = 'waiting'
    end 
    @user.each do |user|
        if Subscription.where(user_id: user.id, place_id: @curplace.id).count > 0 
          UserMailer.welcome_email(user).deliver
        end
    end
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by_slug!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :slug, :user_id, :content, :place_id, :start_date, :start_time, :end_time, :event_photo, :like_count)
    end
end
