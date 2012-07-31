class EventsController < ApplicationController

	def index
	
		@event= Event.new
		@events = Event.all
		@date = params[:month] ? Date.parse(params[:month]) : Date.today
		
 
	end

	def create
		 
     @event = Event.new(params[:event])
	 @event.save
	 redirect_to events_path
	end

	def showevent

		@showevent = Event.find(params[:id])

	end




end
