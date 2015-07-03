require 'test_helper'

class AreaOfKnowledgesControllerTest < ActionController::TestCase
  setup do
    @area_of_knowledge = area_of_knowledges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_of_knowledges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_of_knowledge" do
    assert_difference('AreaOfKnowledge.count') do
      post :create, area_of_knowledge: { created_at: @area_of_knowledge.created_at, name: @area_of_knowledge.name }
    end

    assert_redirected_to area_of_knowledge_path(assigns(:area_of_knowledge))
  end

  test "should show area_of_knowledge" do
    get :show, id: @area_of_knowledge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_of_knowledge
    assert_response :success
  end

  test "should update area_of_knowledge" do
    patch :update, id: @area_of_knowledge, area_of_knowledge: { created_at: @area_of_knowledge.created_at, name: @area_of_knowledge.name }
    assert_redirected_to area_of_knowledge_path(assigns(:area_of_knowledge))
  end

  test "should destroy area_of_knowledge" do
    assert_difference('AreaOfKnowledge.count', -1) do
      delete :destroy, id: @area_of_knowledge
    end

    assert_redirected_to area_of_knowledges_path
  end
end
