class ConcertsController < ApplicationController
	# C: method to create new movie(GET)
	def new
		@concert = Concert.new
		render("new")
	end

	# C: method to create new movie(POST)
	def create
		# decide what page to redirect user to
		@concert = Concert.new(entry_params)

		if(@concert.save)
			flash[:notice] = "Created new concert succesfully"
			redirect_to(concerts_path)
		else
			flash[:alert] = "Please address the following errors"
			@errors = @concert.errors.full_messages
			render("new")
		end
	end

	# R: method to show all movies
	def index
		@concerts = Concert.all
		render("index")
	end

	# R: method to show an specific movie by id
	def show
		@concert = Concert.find(params[:id])
		render("show")
	end

	# U: method to uptade a specific movie by id (GET)
	def edit
		render("edit")
	end

	# U: method to uptade a specific movie by id (POST)
	def update
		# decide what page to redirect user to
		# after an instance is updated
		# don't forget to alert user of succesful update
	end

	# D: method to delete a specifi movie by id
	def destroy
		# decide what page to redirect user to
		# after an instance is destroyed
		# don't forget to alert user of succesful deletion
	end

	private

	def entry_params
		return params.require(:concert).permit(:artist, :venue, :description, :date, :city, :price, :poster)
	end
end

#   Prefix Verb   URI Pattern                  Controller#Action
#     concerts GET    /concerts(.:format)          concerts#index
#              POST   /concerts(.:format)          concerts#create
#  new_concert GET    /concerts/new(.:format)      concerts#new
# edit_concert GET    /concerts/:id/edit(.:format) concerts#edit
#      concert GET    /concerts/:id(.:format)      concerts#show
#              PATCH  /concerts/:id(.:format)      concerts#update
#              PUT    /concerts/:id(.:format)      concerts#update
#              DELETE /concerts/:id(.:format)      concerts#destroy

