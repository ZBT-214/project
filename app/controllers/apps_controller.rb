class AppsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_app, only: [:show, :edit, :update, :destroy]


  # before_action   :require_login
  # GET /apps
  # GET /apps.json
  
  def index
    @p_apps = App.where(is_public: true)
    if user_signed_in?
      @u_apps = current_user.apps.where.not(is_public: true)
      @apps = @u_apps + @p_apps
    else
      @apps = @p_apps
    end

    # published_apps = App.where(is_published: true)
    # own_apps = current_user.apps
    # published_apps + own_apps
  end

  # GET /apps/1
  # GET /apps/1.json
  def show 
      if user_signed_in?
        unless current_user.email == @app.user.email || @app.is_public
           authorize! :show, @app
        end
      else
        unless @app.is_public
          authorize! :show, @app
        end
      end
  end

  # GET /apps/new
  def new
    @app = App.new
    authorize! :new, @app
  end

  # GET /apps/1/edit
  def edit
    authorize! :edit, @app
  end

  # POST /apps
  # POST /apps.json
  def create
    authorize! :create, @app
    @app = App.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    authorize! :update, @app
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    authorize! :destroy, @app
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :sdescription ,:description, :is_public, versions_attributes: [:name], users_attributes: [:email])
    end

end
