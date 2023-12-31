class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups if current_user
  end

  def show
    @group = Group.find(params[:id])
    redirect_to group_entities_path(@group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path, notice: 'Group was successfully destroyed.'
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
