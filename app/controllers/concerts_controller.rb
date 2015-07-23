require("rspotify")

class ConcertsController < ApplicationController

	before_action(:authorize_user)
  	before_action(:admin_only, :only => [:new, :post])

	# C: method to create new concert(GET)
	def new
		@concert = Concert.new
		render("new")
	end

	# C: method to create new concert(POST)
	def create

		album = RSpotify::Artist.search(entry_params[:artist]).first.albums.first
		poster_url = album.images[1]["url"]

		# @concert = Concert.new(entry_params)
		@concert = Concert.new({artist: entry_params[:artist], venue: entry_params[:venue], description: entry_params[:description], date: entry_params[:date], city: entry_params[:city], price: entry_params[:price], poster: poster_url, featured: entry_params[:featured]})

		if(@concert.save)
			flash[:notice] = "Created new concert succesfully"
			redirect_to(concerts_path)
		else
			flash[:alert] = "Please address the following errors"
			@errors = @concert.errors.full_messages
			render("new")
		end
	end

	# R: method to show all concerts
	def index
		@concerts = Concert.all
		render("index")
	end

	# R: method to show an specific concert by id
	def show
		@concert = Concert.find(params[:id])
		render("show")
	end

	# R: method to show today's concerts
	def today
		@concerts = Concert.where("extract(month from date) = ? and extract(day from date) = ? and extract(year from date) = ?", DateTime.now.month, DateTime.now.day, DateTime.now.year)
		render("index")
	end

	# R: method to show this month's concerts
	def this_month
		@concerts = Concert.where("extract(month from date) = ? and extract(year from date) = ?", DateTime.now.month, DateTime.now.year)
		render("index")
	end

	# R: method to show featured concerts
	def featured
		@concerts = Concert.where(featured: true)
		render("index")
	end

	# U: method to uptade a specific concert by id (GET)
	def edit
		render("edit")
	end

	# U: method to uptade a specific concert by id (POST)
	def update
		# decide what page to redirect user to
		# after an instance is updated
		# don't forget to alert user of succesful update
	end

	# D: method to delete a specifi concert by id
	def destroy
		# decide what page to redirect user to
		# after an instance is destroyed
		# don't forget to alert user of succesful deletion
	end

	private

	def entry_params
		return params.require(:concert).permit(:artist, :venue, :description, :date, :city, :price, :poster, :featured)
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

