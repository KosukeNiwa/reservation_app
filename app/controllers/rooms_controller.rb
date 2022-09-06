class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find_by(id: params[:id])
    @reservation = Reservation.new

  end  

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :room_charge, :room_address, :room_pic))
    if @room.save
      flash[:notice] = "Room was successfully created."
      redirect_to :rooms
    else
      render "new"
    end

  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    flash[:notice] = "Room was successfully deleted."
    redirect_to :rooms
  end

  def search
    if params[:area]
      @rooms = Room.where(["room_address like?", "%#{params[:area]}%"])
      @search_total = Room.where(["room_address like?", "%#{params[:area]}%"]).count
    elsif params[:keyword]
      @rooms = Room.where(["room_name like? or room_address like? or room_introduction like?" , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ])
      @search_total = Room.where(["room_name like? or room_address like? or room_introduction like?" , "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ]).count
    else
    end
  end
end
