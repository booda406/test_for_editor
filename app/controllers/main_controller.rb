class MainController < ApplicationController

	def index
		
	end

	def save_image
		image = params[:images][0]
		filename = image.original_filename
		File.open(File.join(Rails.root, 'public', 'images', filename), 'wb') { |f| f.write image.tempfile.read }
		url = Rails.root + '/public' + '/images' + filename
		json = {uploaded: 1, fileName: filename, url: url}.to_json
		render json: json
	end

end
