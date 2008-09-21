class Item < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  has_attached_file :picture,
                    :styles => {:medium => "250x250", :thumb => "100x100"},
                    :default_style => :thumb,
                    :default_url => "/images/noimage.png"
  belongs_to :user
  validates_presence_of :title, :description
end
