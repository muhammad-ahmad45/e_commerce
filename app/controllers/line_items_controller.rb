class LineItemsController < ApplicationController

  def update_quantity
    @line_item = LineItem.find(params[:id])
    new_quantity = params[:new_quantity].to_i
    if @line_item.update(quantity: new_quantity) &&  @line_item.update(total_price: new_quantity * @line_item.product.price)
      render json: { success: true, new_quantity: new_quantity }
    else
      render json: { success: false, errors: @line_item.errors.full_messages }
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to user_cart_path(current_user, @line_item.cart), status: :see_other
  end

  private

  def line_item_params
    params.require(:line_item).permit(:new_quantity)
  end

end
