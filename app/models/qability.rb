class Ability 
  include CanCan::Ability 
   
   
  def initialize(user_role)
      user_role ||= User.new
        if user_role == "instructor"
            cannot :read, Student
        end
  end
end