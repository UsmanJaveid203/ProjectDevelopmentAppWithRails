class DeveloperbugsController < ApplicationController 
    def index 
        @project = Project.find(params[:project_id])
        @developerbugs = Developerbug.joins(:bug).where(:bug=>{project_id: @project.id})
    end

    def show 
        @developerbug = Developerbug.find(params[:id])
    end

    def new 
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.new
    end

    def create 
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.create(title: params[:bug][:title], description: params[:bug][:description], type: params[:bug][:type] , user_id: current_user.id)
        if @bug 
            @bug.save 
        end 

        @developerbug = Developerbug.create(user_id: current_user.id , bug_id: @bug.id)
             
        if @developerbug.save 
            redirect_to project_developerbugs_path
        end
       
    end

    def edit 
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.new
    end

    def update 
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.find(params[:id])
        
        @bugg= @bug.update(title: @bug.title , description: @bug.description, type: @bug.type , status:params[:bug][:status] )
        if(@bugg)
            redirect_to project_developerbugs_path
        end    
    end


    def destroy 
        @projectbug = authorize Developerbug.find_by(bug_id: params[:developerbug][:bug_id] , user_id: params[:id])
        if @projectbug.destroy 
            redirect_to project_developerbugs_path 
        else 
            render "index" 
        end 
    end

end 