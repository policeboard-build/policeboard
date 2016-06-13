class Extranet::CaseFilesController < ApplicationController
  before_action :set_case

  
  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting file" unless @case.save
    redirect_to :back   
  end

  private
  
  def set_case
   #raise params.inspect
   @case = Case.find(params[:case_id])
  end
  
  def remove_image_at_index(index)
    #remain_files = @case.files
    raise remain_files.inspect
    delete_file = remain_files.delete_at(index)
    delete_file.try(:remove!)
    @case.files = remain_files;
  end

  def files_params
    params.fetch(:case, {}).permit({files: []})
  end

end
