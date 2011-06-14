class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  cache
  
  #fields
  field :content
  
  referenced_in :forum_user
  referenced_in :topic
  referenced_in :forum

end