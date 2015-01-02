class RoutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = current_user.routes
  end

  def show
  end

  def new
    @route = current_user.routes.new
  end

  def edit
  end

  def create
    handle_create
  end

  def update
    handle_update(@route)
  end

  def destroy
    handle_destroy(@route)
  end

  private

  def route_params
    params.require(:route).permit(:make_private, :starting_system, :starting_dock, :ending_system, :ending_dock, :commodity, :buy_price, :sell_price, :distance)
  end

  def set_route
    @route = Route.find(params[:id])
  end

  def handle_create
    @route = current_user.routes.new(route_params)

    if @route.save
      flash[:notice] = "Route Saved"
      redirect_to routes_path
    else
      flash[:error] = "Error Detected"
      render action: :new
    end
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
