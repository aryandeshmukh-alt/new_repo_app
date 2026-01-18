class CommentPolicy < ApplicationPolicy
  def create?
    record.blog.published?
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user == record.user || user.admin?
  end
end
