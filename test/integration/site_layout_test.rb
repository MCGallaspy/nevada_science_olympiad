require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'layout_links' do
    get root_path
    assert_template 'layouts/application'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', events_path
    assert_select 'a[href=?]', coe_path
  end
end
