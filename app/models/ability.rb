class Ability
  include CanCan::Ability

  def initialize(user) #這個 user 其實就是 devise 提供的 current_user
    if user.blank? # not logged in
      can :create, User
      basic_read_only
    elsif user.has_role?(:admin) #如果 role 為 admin
      can :manage, :all #可管理所有資源
    elsif user.has_role?(:sale)
      can :manage, Item, user_id: user.id
      can :manage, User, user_id: user.id
    else
      member_only
    end
  end

  protected

  def basic_read_only
    can :read, Item
  end

  def member_only
    can :read, Item
    can :manage, User
  end

end

#:manage: 是指這個 controller 內所有的 action
#:read :  指 :index 和 :show
#:update: 指 :edit  和 :update
#:destroy:指 :destroy
#:create: 指 :new   和 :crate