class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.all
  end 

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:start_day, :end_day, :people, :room_id))
    @room = Room.find_by(id: @reservation.room_id)

    if @reservation.invalid?
      # flash[:notice] = "error!"
      render "rooms/show"
    
    end
    if @reservation.start_day.present? && @reservation.end_day.present?
      @total_day = (@reservation.end_day - @reservation.start_day).to_i
      @total_price = @total_day * (@room.room_charge).to_i
    end

  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
    @room = Room.find_by(id: @reservation.room_id)
    
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_day, :end_day, :people, :room_id, :total_price))

    if @reservation.save
      flash[:notice] = "Reservation was successfully created."
      redirect_to reservation_path(@reservation.id)

    end
    
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    @reservation.destroy
    flash[:notice] = "reservation was successfully deleted."
    redirect_to :reservations
  end


end
