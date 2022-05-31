# frozen_string_literal: true

class Ability
  #include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    customer ||= Customer.new

    # role が admin のユーザーはモデルの操作を行うことができて管理者画面を閲覧可能
    #if user.has_role?(:admin)
    #  can :manage, :all
    #  can :access_admin_page, :all

    # role が manager のユーザーはモデルの操作を行うことができるが、管理者画面は閲覧不可能
    #elsif user.has_role?(:manager)
    #  can :manage, :all
    #  cannot :access_admin_page, :all

    # role が read_only のユーザーはモデルの操作を行うことができず閲覧のみ可能、管理者画面は閲覧不可能
    if user.has_role?(:read_only)
      can :read, :all
      cannot :access_admin_page, :all

    # role を持っていないユーザーは全ての画面が閲覧不可能
    else
      cannot :read, :all
    end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
