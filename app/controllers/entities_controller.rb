class EntitiesController < ApplicationController
    before_action :set_group
  
    def index
      @entities = @group.entities.order(created_at: :desc)
      @total_amount = @entities.sum(:amount)
    end
  
    def new
      @entity = @group.entities.new
    end
  
    def create
  @group = Group.find(params[:group_id])
  @entity = @group.entities.build(entity_params)

  if @entity.save
    redirect_to group_entities_path(@group), notice: 'Entity was successfully created.'
  else
    render :new
  end
end
  
    private
  
    def set_group
      @group = Group.find(params[:group_id])
    end
  
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
  end