class Ability
  include CanCan::Ability

  def initialize(user)
    @profile = (user && user.profile) ? user.profile : Profile.new
  	@profile.roles.each { |role| send(role) }

    if @profile.roles.size == 0
      can :manage, :all #for guest without roles
    end
  end

  def guest
    can :read, Post
  end

  def student
    can :read, Post
  end

  def teacher
    can :manage, Folder
    can :manage, FileItem
    cannot :manage, Post
  end

  def administrator
    can :manage, :all
  end

end
