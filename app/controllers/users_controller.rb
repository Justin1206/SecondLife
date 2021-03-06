class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_user, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
  
    # GET /users
    # GET /users.json
    def index
      @buyorders = Order.where(buyller_id: current_user) #待確認訂單
      @sellorders = Order.where(seller_id: current_user) #待確認訂單
    end
  
    #我要當賣家
    def usertosale
      @user = User.find(params[:id])      
      current_user.add_role :sale
      redirect_to users_path
    end

    def useritem
      @user = current_user
    end

    def userfavorite
      @items = Item.all   
    end

    
    # GET /users/1
    # GET /users/1.json
    def show
    end
  
    # GET /users/new
    # def new
    #   @user = user.new
    # end
  
    # GET /users/1/edit
    def edit
    end
  
    # POST /users
    # POST /users.json
    # def create
    #   @user = current_user.user.build(user_params)
  
    #   respond_to do |format|
    #     if @user.save
    #       format.html { redirect_to @user, notice: 'user was successfully created.' }
    #       format.json { render :show, status: :created, location: @user }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @user.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end
  
    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      @user = User.find(params[:id])      
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /users/1
    # DELETE /users/1.json
    # def destroy
    #   @user.destroy
    #   respond_to do |format|
    #     # format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
    #     format.json { head :no_content }
    #   end
    # end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_user
      #   @user = current_user.find(params[:id])
      # end

      # def set_user
      #   @user = User.find(params[:id])
      # end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:email, :encrypted_password )
      end  
end
