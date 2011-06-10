class Forum < ActiveRecord::Base
  
  formats_attributes :description
  
  acts_as_list

  validates :name, :presence => true,  :uniqueness => true
  
  belongs_to :parent
  
  has_permalink :name
  
  attr_readonly :posts_count, :topics_count

  has_many :topics, :order => "#{Topic.table_name}.sticky desc, #{Topic.table_name}.last_updated_at desc", :dependent => :delete_all

  has_many :recent_topics, :class_name => 'Topic', :include => [:parent], :order => "#{Topic.table_name}.last_updated_at DESC"
  has_one  :recent_topic,  :class_name => 'Topic', :order => "#{Topic.table_name}.last_updated_at DESC"

  has_many :posts,       :order => "#{Post.table_name}.created_at DESC", :dependent => :delete_all
  has_one  :recent_post, :order => "#{Post.table_name}.created_at DESC", :class_name => 'Post'

  has_many :moderatorships, :dependent => :delete_all
  has_many :moderators, :through => :moderatorships, :source => :parent

  # oh has_finder i eagerly await thee
  def self.ordered_forums
    order("position asc")
  end
  
  def to_param
    permalink
  end

  def to_s
    name
  end
  
  
end