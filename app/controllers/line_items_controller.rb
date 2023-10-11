class LineItemsController < ApplicationController

  # def edit
  #   @line_item = LineItem.find(params[:id])
  # end
  
  # def update
  #   @line_item = LineItem.find(params[:id])

  #   if @line_item.update(line_item_params)
  #     redirect_to user_cart_path(current_user, @line_item.cart)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def update_quantity
    @line_item = LineItem.find(params[:id])
    new_quantity = params[:new_quantity].to_i
    if @line_item.update(quantity: new_quantity)
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
