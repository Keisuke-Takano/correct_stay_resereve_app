class ReservationsController < ApplicationController

    def create
        @reserve = Reserve.new(start_date: params[:start_date],
        end_date: params[:end_date],
        number_of_people: params[:number_of_people],
        user_id: @current_user.id,
        post_id: params[:post_id]
        )
        if @reserve.save     
            flash[:notice] = "予約しました"
            redirect_to("/users/#{@current_user.id}/index")   
        else
            flash.now[:notice] = "未入力があります"
            render("posts/show")
        end                 
    end
    
end
