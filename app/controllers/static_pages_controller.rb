class StaticPagesController < ApplicationController
  before_filter :confirm_logged_in
  def home
  end

  def dashboard
  end
end
