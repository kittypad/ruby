Child.destroy_all
ParentClientApplication.destroy_all
Parent.destroy_all
ClientApplicationCategory.destroy_all
Grade.destroy_all
ClientApplication.destroy_all
Developer.destroy_all

developer = Developer.create(:email => 'richard@kittypad.com', :password => 'richard', :password_confirmation => 'richard')

game_application1 = developer.game_applications.create(:name => 'first app', :description => 'first app', :identifier => 'com.applie.identifier1')
game_application2 = developer.game_applications.create(:name => 'second app', :description => 'second app', :identifier => 'com.applie.identifier2')

[[:junior, 0, 999], [:senior, 1000, 9999], [:top, 1000, 999999999]].each do |name, min_score, max_score|
  Grade.create(:name => name, :min_score => min_score, :max_score => max_score)
end

[:math, :chinese, :english].each do |name|
  ClientApplicationCategory.create(:name => name)
end

parent = Parent.create(:email => 'parent@kittypad.com', :password => 'parent', :password_confirmation => 'parent')

ParentClientApplication.create(:parent => parent, :client_application => game_application1)
ParentClientApplication.create(:parent => parent, :client_application => game_application2)

child1 = parent.children.create(:fullname => 'Child1', :gender => 'male', :birthday => '2003/11/07')
child2 = parent.children.create(:fullname => 'Child2', :gender => 'female', :birthday => '2006/11/02')

game_application1.time_trackers.create(:child=>child1,:time=>30,:created_at => 2.days.ago)
game_application1.time_trackers.create(:child=>child1,:time=>20,:created_at => 4.days.ago)
game_application1.time_trackers.create(:child=>child1,:time=>50,:created_at => 5.days.ago)

game_application2.time_trackers.create(:child=>child2,:time=>10,:created_at => 1.days.ago)
game_application2.time_trackers.create(:child=>child2,:time=>30,:created_at => 3.days.ago)
game_application2.time_trackers.create(:child=>child2,:time=>40,:created_at => 5.days.ago)
