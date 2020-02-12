class ProjectsPersonasController < ApplicationController
before_action :set_movietag, only: [:show, :edit, :update, :destroy]

  def create
    project= Project.find(params[:project_id])
    persona=Persona.find_or_create_by(name: params[:persona][:palabra])

    if  project.personas.include?(persona)
      flash[:notice] = 'relacion ya exuste'
    elsif persona.name.length < 1
      flash[:notice] = 'relacion vacia'
    else
    flash[:notice] = 'exito'
        project.personas << persona
        project.save
        flash[:notice] ='si guardo'
    end
  redirect_to root_path
end

  def destroy
  @project.personas.delete(@persona)

  respond_to do |format|
    format.html { redirect_to root_url, notice: 'relacion was successfully destroyed.' }
    format.json { head :no_content }
  end

  end

  private
  def set_movietag
    @project = Project.find(params[:project_id])
    @persona = Persona.find(params[:persona_id])
  end
end
