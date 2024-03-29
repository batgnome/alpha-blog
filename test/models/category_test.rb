require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sports")
    end
    test "categories should be valid" do
        assert @category.valid?
    end

    test "name shoud be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "name shoud be unique" do
       @category.save
       @category2 = Category.new(name: "sports")
       assert_not @category2.valid?
    end

    test "name shoud not be too long" do
        @category.name = "p" * 26
        assert_not @category.valid?
    end

    test "name shoud not be too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end
end