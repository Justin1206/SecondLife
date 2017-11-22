class Admin::UsersController < AdminController
    before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
  
    # GET /users
    # GET /users.json
    def index
      @users = User.all
    end
  
    #我要當賣家
    def tosale
      current_user.add_role :sale
      redirect_to admin_users_path
    end

    def nottosale
      current_user.remove_role :sale      
      redirect_to admin_users_path
    end

    def toadmin
      current_user.add_role :admin
      redirect_to admin_users_path
    end

    def nottoadmin
      current_user.remove_role :admin      
      redirect_to admin_users_path
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
    #   @user = current_user.user.build(admin_user_params)
  
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
      respond_to do |format|
        if @user.update(admin_user_params)
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

      def set_admin_user
        @user = User.find(params[:id])
      rescue
        redirect_to root_path, notice: "查無此候選人"
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def admin_user_params
        params.require(:user).permit(:email, :encrypted_password )
      end  
end
