require "test_helper"

class MetaInformation::Test < ActiveSupport::TestCase
  test "adds an accessor to the model" do
    post = Post.new
    post.source_data = { title: "Performance improvements and more" }
    post.save!

    assert_equal({ "title" => "Performance improvements and more" }, post.source_data)
  end

  test "allows accessing data of new records" do
    post = Post.new
    post.source_data = { title: "Performance improvements and more" }
    assert_equal({ "title" => "Performance improvements and more" }, post.source_data)
  end

  test "saves only after the model was saved" do
    post = Post.create!
    post.source_data = { title: "Performance improvements and more" }

    assert post.source_data
    assert_nil post.reload.source_data
  end

  test "deletes the meta information if set to nil" do
    post = Post.create!(source_data: { title: "Performance improvements and more" })
    post.source_data = nil
    post.save!

    assert_nil post.reload.source_data
  end

  test "only deletes meta information after save" do
    post = Post.create!(source_data: { title: "Performance improvements and more" })
    post.source_data = nil

    refute_nil post.reload.source_data
  end

  test "it updates meta information if changed" do
    post = Post.create!(source_data: { title: "Performance improvements and more" })
    post.source_data = { title: "Changed" }
    post.save!

    assert_equal({ "title" => "Changed" }, post.reload.source_data)
  end

  test "it updates meta information for new records" do
    post = Post.create!(source_data: { title: "Performance improvements and more" })
    post.source_data = { title: "Changed" }

    assert_equal({ "title" => "Changed" }, post.source_data)
  end

  test "it removes meta information along with the parent" do
    post = Post.create!(source_data: { title: "Performance improvements and more" })
    meta_information = post.source_data_content

    post.destroy!
    assert_raises(ActiveRecord::RecordNotFound) { meta_information.reload }
  end
end
