class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.admin?
      can :manage, :all
    elsif user.creat?
      can :manage, :capo
      can :manage, :guardaroba
      can [:read, :create, :update], :creator
      cannot :destroy, :creator
      can :manage, :outfit
      cannot :manage, :admin
    else
      can :manage, :capo
      can :manage, :guardaroba
      can [:read, :create], :creator
      cannot :destroy, :creator
      can :read, :outfit
      cannot [:create, :update, :destroy], :outfit
      cannot :manage, :admin
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
