class OrdersController < ApplicationController
    before_action :authenticate_user!
    skip_authorization_check

    def index
        @order = Order.all.where(buyer_id: current_user)
    end

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        @order.item_id  = @item.id
        @order.buyer_id = @conversation.sender_id
        @order.seller_id = @conversation.recipient_id
    
        respond_to do |format|
            if @order.save
                format.html { redirect_to orders_path, notice: '建立成功' }
                # format.json { render :show, status: :created, location: @item }
              else
                format.html { render :new }
                format.json { render json: @order.errors, status: :unprocessable_entity }
              end
        end
    end

    def destroy
        @order.destroy
        respond_to do |format|
        # format.html { redirect_to :back, notice: '成功刪除商品' }
        format.js # destroy.js.erb
        end
    end

      private

      def set_order
        @order = Order.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def order_params
        params.require(:order).permit( :meettime, :meetlocation, :note )
      end
end