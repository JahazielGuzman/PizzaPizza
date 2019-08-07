class AppearancesController < ApplicationController

	def new
		@appearance = Appearance.new
		if params[:episode]
			@episode = Episode.find(params[:episode])
		end
		@guests = Guest.all
		@episodes = Episode.all
	end

	def create
		byebug
		@appearance = Appearance.new(appearance_params)

		if @appearance.valid?
			@appearance.save
			redirect_to episode_path(@appearance.episode)
		else
			flash[:errors] = @appearance.errors.full_messages
			redirect_to new_appearance_path
		end
	end

	private

	def appearance_params
		params.require(:appearance).permit(:rating, :episode_id, :guest_id => [])
	end
end
