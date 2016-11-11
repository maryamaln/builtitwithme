class RolesController < ApplicationController
	def create
		if(params[:title]=="Both")
			role = Role.create(title: "Developer",idea_id: params[:id] )
			role = Role.create(title: "Designer",idea_id: params[:id] )
		else
			role = Role.create(title: params[:title],idea_id: params[:id] )
		end
		respond_to do |format|
      format.json {render :json => {:message => "Success"} }
    end
	end

	private
    def idea_parameters
      params.permit(:title)
    end
end
