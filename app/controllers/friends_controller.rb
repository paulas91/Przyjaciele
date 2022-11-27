# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[show edit update destroy]
  before_action :order_friends, only: %i[index school party holiday work]

  def index; end

  def show; end

  def new
    @friend = current_user.friends.build
  end

  def edit; end

  def create
    @friend = current_user.friends.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to friend_url(@friend), notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def school
    @friends = @friends.with_cognition(:school)
  end

  def work
    @friends = @friends.with_cognition(:work)
  end

  def party
    @friends = @friends.with_cognition(:party)
  end

  def holiday
    @friends = @friends.with_cognition(:holiday)
  end

  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end

  def order_friends
    @friends = current_user.friends.display_order
  end

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :email, :residence, :cognition)
  end
end
