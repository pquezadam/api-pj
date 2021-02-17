class Api::V1::ProductsController < Api::V1::BaseController
  def index
    respond_with products
  end

  def show
    respond_with product
  end

  def create
    respond_with products.create!(product_params)
  end

  def update
    respond_with product.update!(product_params)
  end

  def destroy
    respond_with product.destroy!
  end

  private

  def product
    @product ||= Product.find_by!(id: params[:id])
  end

  def products
    @products ||= order.products
  end

  def order
    @order ||= Order.find_by!(id: params[:order_id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :sku,
      :type,
      :price
    )
  end
end
