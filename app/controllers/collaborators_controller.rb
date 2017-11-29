class CollaboratorsController < ApplicationController

    def new
        @users = User.all
        @collaborator = Collaborator.new
    end

    def create
        @user = User.find(params[:collaborators][:user_id])
        @wiki = Wiki.find(params[:collaborators][:wiki_id])
        @collaborator = Collaborator.new(wiki: @wiki, user: @user)

        if @wiki.users.include?(@user)
            flash[:notice] = "#{@user.email} is already a collaborator. Try adding someone else."
            redirect_to wiki_path(id: params[:collaborators][:wiki_id])
        elsif @collaborator.save
            flash[:notice] = "#{@user.email} is now a collaborator."
            redirect_to wiki_path(id: params[:collaborators][:wiki_id])
        else
            flash[:error] = @collaborator.errors.full_messages.to_sentance
            render template: "wiki/edit"
        end
    end

    def destroy
        @collaborator = Collaborator.find(params[:id])
        @wiki = @collaborator.wiki
        if @collaborator.destroy
            flash[:notice] = "Collaborator has been removed"
            redirect_to edit_wiki_path(@wiki)
        else
            flash[:error] = "There was an error, please try again."
            redirect_to wiki_path
        end
    end
end
