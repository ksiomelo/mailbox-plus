#collection @nearby, :object_root => false
object false

node :radius do 
  @search[:radius]
end

node :latitude do 
  @search[:latitude]
end

node :longitude do 
  @search[:longitude]
end


child(@nearby, :object_root => false) { 
	attribute :street, :latitude, :longitude 
	child :user do
		node :name do |u|
	  		u.first_name + " " + u.last_name
		end
	  #attributes :first_name, :last_name
	end
}









