class AttachmentsController < ApplicationController
  def upload_attachment
  end

  def download_attachment
  end

  def uploadFile(file)  
    if !file.original_filename.empty?  
      @filename=getFileName(file.original_filename)   
      File.open("#{RAILS_ROOT}/public/upload/#{@filename}", "wb") do |f|  
      f.write(file.read)  
      end  
      return @filename  
    end  
  end  
  
  def getFileName(filename)  
    if !filename.nil?  
      Time.now.strftime("%Y_%m_%d_%H_%M_%S") + '_' + filename  
    end  
  end  
  
  def save  
    unless request.get?  
      if filename=uploadFile(params[:file]['file'])  
        render :text=>filename  
      end  
    end  
  end   
  
end
