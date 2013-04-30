class Project < ActiveRecord::Base

  attr_accessible :title, :description, :user_id

  has_many :notes

  has_many :tasks

  has_many :documents

  def have_tasks?
    if tasks.count > 0
      return true
    end
    false
  end

  def have_documents?
    if documents.count > 0
      return true
    end
    false
  end

end