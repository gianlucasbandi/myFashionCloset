class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.admin?
      cannot :read, Capo
      cannot :manage, Guardaroba
      can [:read, :create, :destroy], Creator
      can [:read, :destroy], Outfit
      cannot [:create], Outfit
      can [:create, :destroy], Report
      can :manage, Admin
    elsif user.creat?
      can :read, Capo
      can [:read, :create], Guardaroba
      can [:read, :Create], Creator
      cannot :destroy, Creator
      can [:read, :create], Outfit
      cannot [:destroy], Outfit
      can :create, Report
      cannot :destroy, Report
      cannot :manage, Admin
    else
      can :read, Capo
      can [:read, :create], Guardaroba
      can [:read, :create], Creator
      cannot :destroy, Creator
      can :read, Outfit
      cannot [:create, :destroy], Outfit
      can :create, Report
      cannot :destroy, Report
      cannot :manage, Admin
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
