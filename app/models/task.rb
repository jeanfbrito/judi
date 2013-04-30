class Task < ActiveRecord::Base
  extend Enumerize

  attr_accessible :title, :description, :project_id, :status, :priority

  enumerize :status, :in => {
    :created => 0, 
    :working => 1, 
    :waiting => 2, 
    :paused => 3, 
    :stopped => 4, 
    :finished => 5
    }, default: :created, scope: true

  enumerize :priority, :in => {
    :urgent => 0, 
    :highest => 1, 
    :high => 2, 
    :medium => 3, 
    :low => 4, 
    :lowest => 5,
    :no => 6
    }, default: :no, scope: true
  
  belongs_to :project

  has_many :notes

  has_many  :documents


  def have_documents?
    if documents.count > 0
      return true
    end
    false
  end

end
