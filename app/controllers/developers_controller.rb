class DevelopersController < ApplicationController
    def index
        @project = Project.find(params[:project_id])
        @developers = Developer.left_outer_joins(:developerprojects).where(:developerprojects=>{:user_id => nil})
    end

    def create

        @developerproject = Developerproject.new(project_id: params[:project_id],user_id: params[:developer][:user_id])
        if @developerproject
            @developerproject.save 
        end

    end

end