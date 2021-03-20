class DeveloperprojectsController < ApplicationController
    def index 
        @project = Project.find(params[:project_id])
        @developers = Developerproject.all.where(project_id: @project.id)
    end

    def destroy 
        @developer = Developerproject.find_by(user_id: params[:id] , project_id: params[:project_id] )
        if @developer.destroy 
            redirect_to root_path 
        else 
            render "index"
        end 
    end
end