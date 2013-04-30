class Document < ActiveRecord::Base

  has_attached_file :attachment, :preserve_files => true

  belongs_to  :project
  belongs_to  :task


end
