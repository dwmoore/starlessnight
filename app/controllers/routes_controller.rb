class RoutesController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    @routes = user.routes
  end

  def show
  end

  def new
    @route = current_user.routes.new
  end

  def edit
  end

  def create
    @route = current_user.routes.new(route_params)
  end

  def update
    handle_update(@route)
  end

  def destroy
    handle_destroy(@route)
  end

  private

  def route_params
    params.require(:route).permit(:make_private, :starting_system, :ending_system, :buy_price, :sell_price, :distance)
  end

  def handle_update(route)
    if route.update(route_params)
      flash[:notice] = "Route Updated"
      redirect_to routes_path
    else
      flash[:error] = "Error Detected"
      render action: :edit
    end
  end

  def handle_destroy(route)
    if route.destroy
      flash[:notice] = "Route Destroyed"
    else
      flash[:error] = "Error Detected"
    end
    redirect_to routes_path
  end

end
