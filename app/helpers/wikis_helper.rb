module WikisHelper

    def user_see_private?
        current_user.premium? || current_user.admin?
    end
end
