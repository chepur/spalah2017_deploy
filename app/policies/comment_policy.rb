class CommentPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.role_admin?
        scope.all
      else
        scope.where('created_at > ?', 3.days.ago)
      end
    end
  end

  def destroy?
    user.role_admin?
  end
end