# 
#  city.rb
#  ruby
#  
#  Created by Zhang Alex on 2011-06-17.
#  Copyright 2011 __KittyPad.com__. All rights reserved.
# 


class City
  include Shared::Mongoid
  
  cache
  
  #fields
  field :name
  referenced_in :state
end