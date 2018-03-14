module ApplicationHelper

    def display_edit_delete_link
        @current_user.id == @user.id
    end
end
