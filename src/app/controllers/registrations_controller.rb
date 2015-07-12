class RegistrationsController < Devise::RegistrationsController
    
    def create
        super
        if resource.save
            student = Student.new()
            student.user_id = resource.id
            student.save!
        end
    
    end
end