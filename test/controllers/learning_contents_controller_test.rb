require 'test_helper'

class LearningContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning_content = learning_contents(:one)
  end

  test "should get index" do
    get learning_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_learning_content_url
    assert_response :success
  end

  test "should create learning_content" do
    assert_difference('LearningContent.count') do
      post learning_contents_url, params: { learning_content: { course_id: @learning_content.course_id, description: @learning_content.description, nome: @learning_content.nome, url: @learning_content.url } }
    end

    assert_redirected_to learning_content_url(LearningContent.last)
  end

  test "should show learning_content" do
    get learning_content_url(@learning_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_learning_content_url(@learning_content)
    assert_response :success
  end

  test "should update learning_content" do
    patch learning_content_url(@learning_content), params: { learning_content: { course_id: @learning_content.course_id, description: @learning_content.description, nome: @learning_content.nome, url: @learning_content.url } }
    assert_redirected_to learning_content_url(@learning_content)
  end

  test "should destroy learning_content" do
    assert_difference('LearningContent.count', -1) do
      delete learning_content_url(@learning_content)
    end

    assert_redirected_to learning_contents_url
  end
end
