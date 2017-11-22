class WikiPolicy < ApplicationPolicy

    class Scope < Scope

        def update?
            @user.present?
        end

        def destroy?
            @user.admin?
        end
    end
end
