class FileUploadController < ApplicationController
    def import        
        uploaded_file = params[:file] 
        items = FileUploadService.new(uploaded_file).import     
        render status: 200, json: items.to_json
    end
end
