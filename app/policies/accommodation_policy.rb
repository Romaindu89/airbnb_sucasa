class AccommodationPolicy < ApplicationPolicy
  # class Scope < Scope
  # #   # NOTE: Be explicit about which records you allow access to!
  #   def resolve
  #     scope.all
  #   end

    def index?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      true
      # record.user == user
    end

    def destroy?
      true
      # record.user == user
    end
  # end
end
