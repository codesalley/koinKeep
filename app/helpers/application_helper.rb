module ApplicationHelper
    def set_avatar(user)
        if user.icon.attached? 
            user.icon
        else
            'icon.png'
        end

    end
    def set_icon(group)
        if group.icon.attached? 
            image_tag(group.icon, class: 'w-1/5') 
        else
            image_tag('icon.png', class: 'w-1/5') 
            
        end
    end
end
