class ProjectPolicy < ApplicationPolicy

  class Scope 
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.type == "Qa"
        scope.all
      elsif user.type == "Developer" 
        Developer.find(user.id).projects
      else
        scope.where(user_id: user)
      end
    end
  end

  def new?
    user.type == "Manager"
  end

  def edit?
    user.type == "Manager"
  end

  def destroy?
    user.type == "Manager"
  end

end