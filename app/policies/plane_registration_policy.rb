class PlaneRegistrationPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def new?
    user.present?
  end

  def update?
    true
  end

  def edit?
    user.present?
  end

  def destroy?
    false
  end
end
