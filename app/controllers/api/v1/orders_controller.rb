class Api::V1::OrdersController < Api::V1::BaseController
  def index
    respond_with paginate(filtered_collection(Order.all))
  end

  def show
    respond_with order
  end

  def create
    respond_with Order.create!(order_params)
  end

  def update
    respond_with order.update!(order_params)
  end

  def destroy
    respond_with order.destroy!
  end

  private

  def order
    @order ||= Order.find_by!(id: params[:id])
  end

  def order_params
    params.require(:order).permit(
      :total
    )
  end
end
