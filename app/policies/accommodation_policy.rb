class AccommodationPolicy < ApplicationPolicy
  # class Scope < Scope
  # #   # NOTE: Be explicit about which records you allow access to!
  #   def resolve
  #     scope.all
  #   end

    def index
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      record.user == user || user.admin? == true
    end

    def destroy?
      record.user == user || user.admin? == true
    end
  # end
end
