class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    alias_action :start_course, :finish_course, to: :start_finish_course
    alias_action :start_subject, :finish_subject, to: :start_finish_subject
    authorize_to_admin if user.admin?
    case controller_namespace
    when Settings.app.controller.namespace_for_admin
      cannot :manage, :all unless user.admin?
    when Settings.app.controller.namespace_for_trainer
      authorize_to_trainer if user.trainer?
    else
      can :index, Course
      authorize_to_trainee if user.trainee?
    end
  end

  private

  def authorize_to_admin
    can :manage, :all
  end

  def authorize_to_trainer
    can %i(read start_finish_subject), CourseSubject
    can %i(read start_finish_course), Course
    can %i(create read update), Task
    can %i(create read update), User
    can :manage, UserCourse
  end

  def authorize_to_trainee
    can %i(create update), UserTask
    can :read, Course
    can :read, CourseSubject
  end
end
