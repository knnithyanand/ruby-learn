class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.user_roles.each { |role| send(role.name) }

    if @user.user_roles.size == 0
      can :read, :all #for guest without roles
    end
  end

  def Administrator
    can :manage, User
    can :manage, School
  end

  def Student
    can :read, Post
  end
  
  def Teacher
    can :manage, Course
    can :manage, Post
  end
end
