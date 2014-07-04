class Ability
  include CanCan::Ability

  def initialize(user)
    @profile = user ? user.profile : Profile.new
    @profile.user_roles.each { |role| send(role.name) }

    if @profile.user_roles.size == 0
      can :read, :all #for guest without roles
    end
  end

  def Administrator
    can :manage, :all
  end

  def Student
    can :read, Post
  end
  
  def Teacher
    can :manage, Course
    can :manage, Post
  end
end
