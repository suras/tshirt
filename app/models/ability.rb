class Ability
  include CanCan::Ability
   
  def initialize(user)
    alias_action :edit, :add_coupon,:read, :update, :view, :show, :to => :permission1
    
   

    
    if(user.is_admin?)
        #can :manage, :all
        can :access, :rails_admin
        can :dashboard 
        can :permission1, [Coupon]

       can :manage, [User, Image, Design, DesignCategory, Price, ProductAttribute, Order, OrderDetail, Product, Category, Slider]

     end
 


    # if(user.user_type == "member")
        
        
    #     # can :manage, [Country]
    #     # can :manage, [City]
    #     # can :manage, [Sate]
        

    # end             # grant access to the dashboard
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end