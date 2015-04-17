class StaticPagesController < ApplicationController
  before_filter :confirm_logged_in

  def dashboard
  end
end
