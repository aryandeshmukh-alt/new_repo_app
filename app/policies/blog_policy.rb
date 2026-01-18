class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      elsif user
        scope.where(published: true).or(scope.where(user_id: user.id))
      else
        scope.where(published: true)
      end
    end
  end

  def show?
    record.published? || owner_or_admin?
  end

  def create?
    user.present?
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  def publish?
    owner_or_admin?
  end

  def drafts?
    user.present?
  end

  private

  def owner_or_admin?
    user&.admin? || record.user_id == user&.id
  end
end
