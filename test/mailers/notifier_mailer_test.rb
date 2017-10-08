require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  test "login_noti" do
    mail = NotifierMailer.login_noti
    assert_equal "Login noti", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
