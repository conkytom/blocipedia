module WikisHelper
    def user_is_authorized_to_edit?
        current_user && (
            (current_user == @wiki.user)
    #        || current_user.admin?
    #        || current_user.collaborator?
        )
    end
end
