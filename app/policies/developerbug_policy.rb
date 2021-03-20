class DeveloperbugPolicy < ApplicationPolicy

  def edit?
    user.type == "Developer"
  end

  def destroy?
    user.type == "Manager"
  end

end
