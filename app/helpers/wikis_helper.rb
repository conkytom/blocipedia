module WikisHelper

    def user_see_private?
        if edit_wiki_url
            current_user.premium?
        elsif new_wiki_url
            current_user.email == @wiki.user.email #|| current_user.collaborator
        end
    end
end
