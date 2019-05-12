class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      value_to_hash = "#{Time.now}#{@user.id}"
      new_changeset_id = Digest::SHA2.hexdigest(value_to_hash)
      new_changeset_time = Time.now
      @meeting.changeset_id = new_changeset_id
      @meeting.changeset_time = new_changeset_time

      if @meeting.save
        Changeset.create(id: new_changeset_id,user_id: @user.id, meeting_id: @meeting.id , change_set: meeting_params.to_json)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      value_to_hash = "#{Time.now}#{@user.id}"
      existing_changeset_id = params[:meeting][:existing_changeset_id]
      existing_changeset_time = params[:meeting][:existing_changeset_time]
      new_changeset_id = Digest::SHA2.hexdigest(value_to_hash)
      new_changeset_time = Time.now

      Rails.logger.error "All params: #{params}"
      Rails.logger.error "--- changeset IDs ---"
      Rails.logger.error "Existing: #{existing_changeset_id}"
      Rails.logger.error "Meeting changeset ID: #{@meeting.changeset_id}"
      # Rails.logger.error "New changeset ID: #{new_changeset_id}"

      if @meeting.changeset_id == existing_changeset_id
        @meeting.changeset_id = new_changeset_id
        @meeting.changeset_time = new_changeset_time

        if @meeting.update(meeting_params)
          Changeset.create(id: new_changeset_id, meeting_id: @meeting.id, user_id: @user.id, change_set: meeting_params.to_json)

          format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
          format.json { render :show, status: :ok, location: @meeting }
        else
          format.html { render :edit }
          format.json { render json: @meeting.errors, status: :unprocessable_entity }
        end
      else
        # TODO: Get changesets that happened since the prior time
        # TODO: Add some error
        flash[:error] = 'Oh no, somebody else edited this record!'
        format.html { render :edit }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:location, :time, :description, :purpose, :max_attendees)
    end
end
