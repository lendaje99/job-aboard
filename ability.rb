class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.email == 'admin@gmail.com'
      can [:create, :update, :destroy], Job
    end

    can :update, Application if user.email == 'admin@gmail.com'
    
end
