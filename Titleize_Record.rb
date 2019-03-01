@bugs = Bug.all
@bugs.each do |bug|
	bug.update(:bug_type => bug.bug_type.titleize)
end
