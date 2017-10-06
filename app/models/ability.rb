class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.has_role? (:super_admin)
        can :manage, :all
        can :access, :rails_admin #only allow admin users to access rails admin
        can :dashboard #allow access to dashboard

      end
      
      if user.has_role? :admin_role
        can :manage, :all?
        can :access, :rails_admin #only allow admin users to access rails admin
        can :dashboard #allow access to dashboard

      end

      if user.has_role? (:user)
        cannot :manage, :all?
        cannot :access, :rails_admin #only allow admin users to access rails admin
        cannot :dashboard #allow access to dashboard

      end
      
       if user.has_role? :customer_role or user.has_role? :production_role or user.has_role? :dealer_role

       cannot :manage, :all?

      end   
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
