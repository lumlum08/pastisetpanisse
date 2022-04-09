class StructuresController < ApplicationController
  before_action :set_structures, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def new
    @structure = Structure.new
  end

  def show
  end

  def index
    @structures = Structure.all
  end

  def create
    @structure = Structure.new(structure_params)
    @structure.user = @user
    if structure.save
      redirect_to structure_path(@structure)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @structure.update(structure_params)
      redirect_to structure_path(@structure)
    else
      render :edit
    end
  end

  def destroy
    @structure.destroy
    redirect_to structures_path
  end

  private

  def set_structures
    @structure = Structure.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def structure_params
    params.require(:structure).permit(:name, :address, :category, :cp, :district, :user_id)
  end
end
