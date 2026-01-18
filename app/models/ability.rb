class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      return
    end

    can :read, Blog, published: true
    can :read, Blog, user_id: user.id

    can :create, Blog
    can :update, Blog, user_id: user.id
    can :destroy, Blog, user_id: user.id
    can :publish, Blog, user_id: user.id

    can :create, Comment do |comment|
      comment.blog.published?
    end

    can :update, Comment, user_id: user.id
    can :destroy, Comment, user_id: user.id
  end
end
