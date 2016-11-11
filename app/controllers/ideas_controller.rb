class IdeasController < ApplicationController
	before_action :authenticate_user
	layout 'custom_layout', :only => [:index,:show,:all_ideas]
	def index
		@ideas = Idea.all
		@idea = Idea.new
	end
	def all_ideas
		if params[:type] == "newest"
			@ideas = Idea.order('created_at DESC')
		elsif params[:type]=="oldest"
			@ideas = Idea.order('created_at ASC')
		elsif params[:type]=="nameasc"
			@ideas = Idea.order('title ASC')
		elsif params[:type]=="namedesc"
			@ideas = Idea.order('title DESC')
		elsif params[:type]=="ios"
			@ideas = Idea.where(platform:"iOS")
		elsif params[:type]=="android"
			@ideas = Idea.where(platform:"Android")
		elsif params[:type]=="web"
			@ideas = Idea.where(platform:"Web")
		elsif params[:type]=="developer"
			@ideas = Idea.where(help_needed:"Developer")
		elsif params[:type]=="designer"
			@ideas = Idea.where(help_needed:"Designer")
		else
		end	
		render 'index'
	end
	def new
		@idea = Idea.new
	end
	def create
		idea = Idea.new(idea_parameters)
		idea.user_id = cookies[:user_id]
		if idea.save
			# if(params[:help_needed]=="Both")
			# 	idea.roles.create(title: "Developer")
			# 	idea.roles.create(title:"Designer")
			# else
			# 	idea.roles.create(title: params[:help_needed])
			# end
			@message = "Successfully created"
			respond_to do |format|
      			format.json {render :json => {:message => @message,:id => idea.id} }
    		end 
		else
			@message = idea.errors.full_messages[0]
			respond_to do |format|
      			format.json {render :json => {:message => @message} }
    		end
		end
	end

	def show
		@idea = Idea.find(params[:id])
		@comment = Comment.new
	end
	def contact_us
		
	end
	private
    def idea_parameters
      params.permit(:title, :description,:skills_description,:platform,:help_needed)
    end
end
