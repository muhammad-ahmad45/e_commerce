# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def destroy
    super
  end

end
