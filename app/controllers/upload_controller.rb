class UploadController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:upload]

  def upload

    puts "*"*64
    puts params

    blob = ActiveStorage::Blob.create_after_upload!(
      io: params[:image],
      filename: params[:image].original_filename,
      content_type: params[:image].content_type
    )

    if blob.save
      success = true
      msg = 'upload success'
    else
      success = false
      msg = "upload error"
    end

    render json: { :success=> success, :msg=>msg, :file_path=> rails_blob_path(blob) }

  end

end
