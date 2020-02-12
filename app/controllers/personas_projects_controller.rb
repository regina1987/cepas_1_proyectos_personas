class PersonasProjectsController < ApplicationController
  before_action :set_movietag, only: [:show, :edit, :update, :destroy]

  def create
    persona=Persona.find(params[:persona_id])
    project=Project.find_or_create_by(name: params[:project][:palabra].downcase)

    if  persona.projects.include?(project)
    flash[:notice] = 'relacion ya exuste'

    elsif project.name.length < 1
    flash[:notice] = 'relacion vacia'

    else
    flash[:notice] = 'exito'
        persona.projects << project
        persona.save
        flash[:notice] ='si guardo'
    end
    redirect_to personas_path
  end

  def destroy
  @persona.projects.delete(@project)

  respond_to do |format|
    format.html { redirect_to personas_url, notice: 'relacion was successfully destroyed.' }
    format.json { head :no_content }
  end
  end

  private
  def set_movietag
    @project = Project.find(params[:project_id])
    @persona = Persona.find(params[:persona_id])
  end
end
