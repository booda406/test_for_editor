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

	def froala_editor
		
	end

	def save_image_froala
		image = params[:file]
		filename = image.original_filename
		File.open(File.join(Rails.root, 'public', 'images', filename), 'wb') { |f| f.write image.tempfile.read }
		url = '/images/' + filename
		Rails.logger.debug "#{url}"
		json = {uploaded: 1, fileName: filename, link: url}.to_json
		Rails.logger.debug "#{json}"
		render json: json		
	end

end
