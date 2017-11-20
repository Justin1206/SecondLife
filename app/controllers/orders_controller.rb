class OrdersController < ApplicationController
    before_action :authenticate_user!
    skip_authorization_check

    def index
    end

    def create
        @order = Oorder.get(params[:item_id], params[:buyer_id], params[:seller_id])        
        @order = Oorder.create(order_params)

        respond_to do |format|
            format.html 
            format.js # destroy.js.erb
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
        params.require(:order).permit(:item_id, :buyer_id, :buyer_rating, :seller_id, :seller_rating, :status, :meettime, :meetlocation, :note )
      end
end