class InstitutionsController < ApplicationController
  before_action :set_institution, only: %i[ show edit update destroy ]

  def index
    @institutions = Institution.all
  end

  def show
  end

  def new
    @institution = Institution.new
  end

  def edit
  end

  def create
    @institution = Institution.new(institution_params)

    respond_to do |format|
      if @institution.save
        format.html { redirect_to institution_url(@institution), notice: "Institution was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @institution.update(institution_params)
        format.html { redirect_to institution_url(@institution), notice: "Institution was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    def destroy
      @institution.products.destroy_all
      @institution.destroy
      redirect_to institutions_path, notice: "Institution and its products were successfully deleted."
    end

  end

  private
    
    def set_institution
      @institution = Institution.find(params[:id])
    end

    def institution_params
      params.require(:institution).permit(:name, :email, :cnpj, :address, :phone)
    end
end
