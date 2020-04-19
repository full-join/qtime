class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @sessions = Sessions.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @sessions = Sessions.new(session_params)

    respond_to do |format|
      if @sessions.save
        format.html { redirect_to @sessions, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @sessions }
      else
        format.html { render :new }
        format.json { render json: @sessions.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @sessions.update(sessions_params)
        format.html { redirect_to @sessions, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @sessions }
      else
        format.html { render :edit }
        format.json { render json: @sessions.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @sessions.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sessions
      @sessions = Sessions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sessions_params
      params.fetch(:sessions, {})
    end
end
