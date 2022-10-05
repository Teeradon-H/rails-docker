class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def login
    if session[:current_user_id] != nil
      redirect_to  '/home'
    end
  end
  def logout
    
    redirect_to  '/login'
    session[:current_user_id] = nil
    # cookies[:current_user_id] = nil
  end
  def check_login
    @data = params.require(:user).permit(:userId, :password)
    @user = User.find_by(userId: @data[:userId])
    if !@user 
      # render :login , asdadssad1
      # respond_to do |format|
      #   format.text { render :text => "no user found" }
      # end 
      # render :text => "<ul>no user</ul>".html_safe
      render html: "<script>alert('No users!')</script>".html_safe
    else
      session[:current_user_id] = @data[:userId]
      session[:role] = @user[:role]
      session[:areaId] = @user[:address]
      # puts session[:areaId],session[:areaId]  , 'asdsss'
      # cookies[:current_user_id] = @data[:userId]
      
      
      
      
        
      redirect_to  '/home'
    end
    
  end
  def register
  end
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
      @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])

  end

  # POST /users or /users.json
  def create
    data = user_params
    data[:role] = params[:role]
    @user = User.new(data)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      # @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:userId, :password, :email, :name, :email, :address, :address1, :role)
    end
end
# http://localhost:3000/users/register/general