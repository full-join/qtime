class SessionsController < ApplicationController
  before_action :set_sessions, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Sessions.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    # @sessions = Sessions.new(session_params)

    # respond_to do |format|
    #   if @sessions.save
    #     format.html { redirect_to @sessions, notice: 'Session was successfully created.' }
    #     format.json { render :show, status: :created, location: @sessions }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @sessions.errors, status: :unprocessable_entity }
    #   end
    # end
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/profile'
    else
      flash.now[:danger] = 'Incorrect email or password. Please try again.'
      redirect_to '/login'
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
    logout_current_user
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sessions
      @sessions = Sessions.find(params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def sessions_params
      params.fetch(:sessions, {})
    end
end
