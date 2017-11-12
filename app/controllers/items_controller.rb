class ItemsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /items
  # GET /items.json

  def favorite
    type = params[:type]
    if type == "favorite"
            if 
              current_user.favorites.include?(@item)
            else
              current_user.favorites << @item
            end
    elsif type == "unfavorite"
        current_user.favorites.delete(@item)
    end
  end

  def index
    if params[:search]
      @items = Item.where('name LIKE ? OR  category LIKE ?', "%#{params[:search]}%",  "%#{params[:search]}%")
    else
      @items = Item.all
    end  
  end

  # GET /items/1
  # GET /items/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = current_user.item.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to users_path, notice: '商品建立成功' }
        # format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to users_path, notice: '商品修改成功' }
        # format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      # format.html { redirect_to :back, notice: '成功刪除商品' }
      format.js # destroy.js.erb
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :status, :amount, :price, :picture, :category, :user_id )
    end
end
