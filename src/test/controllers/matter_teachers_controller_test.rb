require 'test_helper'

class MatterTeachersControllerTest < ActionController::TestCase
  setup do
    @matter_teacher = matter_teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matter_teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matter_teacher" do
    assert_difference('MatterTeacher.count') do
      post :create, matter_teacher: { matter_id: @matter_teacher.matter_id, teacher_id: @matter_teacher.teacher_id, value: @matter_teacher.value }
    end

    assert_redirected_to matter_teacher_path(assigns(:matter_teacher))
  end

  test "should show matter_teacher" do
    get :show, id: @matter_teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matter_teacher
    assert_response :success
  end

  test "should update matter_teacher" do
    patch :update, id: @matter_teacher, matter_teacher: { matter_id: @matter_teacher.matter_id, teacher_id: @matter_teacher.teacher_id, value: @matter_teacher.value }
    assert_redirected_to matter_teacher_path(assigns(:matter_teacher))
  end

  test "should destroy matter_teacher" do
    assert_difference('MatterTeacher.count', -1) do
      delete :destroy, id: @matter_teacher
    end

    assert_redirected_to matter_teachers_path
  end
end
