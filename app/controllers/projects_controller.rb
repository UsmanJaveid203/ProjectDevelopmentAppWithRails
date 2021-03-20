class ProjectsController < ApplicationController

    def index 
        @projects = policy_scope(Project)
    end 

    def show
        @project = Project.find(params[:id])
    end

    def new 
        @project = authorize Project.new
    end

    def create 
        @project = Project.new(project_params)
        @project.user_id = current_user.id

        if @project.save 
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @project = authorize Project.find(params[:id])
    end

    def update 
        @project = Project.find(params[:id])
        if @project.update(project_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to root_path
    end
    
private
    def project_params 
        params.require(:project).permit(:name, :description);
    end
end