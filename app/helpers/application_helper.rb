module ApplicationHelper
    def render_validator(data)
        return "<p class='text-center' > No Data </p>".html_safe  if data.nil?
        render 'transactions', group: data 
    end
    def show_chart
        if Transaction.count < 1 || Group.count < 1
            "<p class='text-center font-bold text-gray-500 md:p-5'> No Group Data To Display Chart</p>".html_safe
        else
            @new_hash = []
            Group.all.each  do|itm| 
                @new_hash << [itm['name'] , itm.transactions.count] 
            end      
            pie_chart  @new_hash
        end
    end
    def render_navbar
        if current_user
            render partial: 'shared/navbar'
        else 
            render partial: 'shared/new'    
        end
    end

    def delete_transaction(transaction)
        link_to  group_transaction_path(transaction), method: :delete do
            "<span class='flex h-4 w-4 absolute -top-1 -right-1'>
                <span class='animate-ping absolute inline-flex h-full w-full rounded-full bg-green-200 opacity-75'></span>
                <span class=' inline-flex absolute rounded-full h-4 w-4 bg-green-100'></span>
            </span>".html_safe              
        end
    end

    def get_heading(data)
        if data.nil? 
            'No Data'
        else
             data.name.upcase
        end
    end

    def date_formatter(date)
        return unless date 

       return date.to_formatted_s(:long_ordinal)
    end

    def set_avatar(user)
        if user.icon.attached? 
            user.icon
        else
            'icon.png'
        end
    end
    def set_icon(group)
        if group.nil? || !group.icon.attached?
            image_tag('icon.png', class: 'w-1/5 md:w-2/6') 
        else
            image_tag(group.icon, class: 'w-1/5 md:w-2/6') 
            
        end
    end
end
