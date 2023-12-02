class EntitiesController < ApplicationController
  before_action :set_group

  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.build(entity_params)
    @entity.author_id = current_user.id

    if @entity.save
      redirect_to group_path(@group), notice: 'Entity was successfully created.'
    else
      render :new
    end
  end

  def index
    @entities = @group.entities.order(created_at: :desc)
    @total_amount = @entities.sum(:amount)
  end

  def new
    @entity = Entity.new
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy

    redirect_to group_path(@group), notice: 'Entity was successfully destroyed.'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
