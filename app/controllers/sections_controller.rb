class SectionsController < ApplicationController
  layout false

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:name => "default section")
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'index')
    else
      render ('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

    def destroy
    if section = Section.find(params[:id]).destroy
      flash[:notice] = "Section  destroyed successfully."
      redirect_to(:action => 'index')
    else
      render ('delete')
    end
  end

  private

    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, :context_type, :content)
    end

end
