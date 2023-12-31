# frozen_string_literal: true

# in models/admin_ability.rb
class AdminAbility
  include CanCan::Ability
  def initialize(user)
    return unless user && user.admin?

    can :access, :rails_admin
    can :manage, :all
  end
end
