# 
#  parent_perm.rb
#  ruby
#  
#  Created by Zhang Alex on 2011-06-17.
#  Copyright 2011 __KittyPad.com__. All rights reserved.
# 


class Permissions::ParentPerm
  
  def self.got_permissions current_ability
    current_ability.can :read, [Forum, Topic, Post, Search]
    current_ability.can :about, Forum
    current_ability.can :news,  Forum
    current_ability.can [:new, :create],  Topic
    current_ability.can :update, Topic
    current_ability.can [:index, :create], Search
    
  end
end