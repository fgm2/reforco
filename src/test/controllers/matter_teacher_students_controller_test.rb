require 'test_helper'

class MatterTeacherStudentsControllerTest < ActionController::TestCase
  setup do
    @matter_teacher_student = matter_teacher_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matter_teacher_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matter_teacher_student" do
    assert_difference('MatterTeacherStudent.count') do
      post :create, matter_teacher_student: { many: @matter_teacher_student.many, matter_id: @matter_teacher_student.matter_id, student_id: @matter_teacher_student.student_id, teacher_id: @matter_teacher_student.teacher_id }
    end

    assert_redirected_to matter_teacher_student_path(assigns(:matter_teacher_student))
  end

  test "should show matter_teacher_student" do
    get :show, id: @matter_teacher_student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matter_teacher_student
    assert_response :success
  end

  test "should update matter_teacher_student" do
    patch :update, id: @matter_teacher_student, matter_teacher_student: { many: @matter_teacher_student.many, matter_id: @matter_teacher_student.matter_id, student_id: @matter_teacher_student.student_id, teacher_id: @matter_teacher_student.teacher_id }
    assert_redirected_to matter_teacher_student_path(assigns(:matter_teacher_student))
  end

  test "should destroy matter_teacher_student" do
    assert_difference('MatterTeacherStudent.count', -1) do
      delete :destroy, id: @matter_teacher_student
    end

    assert_redirected_to matter_teacher_students_path
  end
end
