ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings={
    :address =>"smtp.gmail.com",
    :domain  => "gmail.com",
    :port => 587,
    :authentication  => "login",
    :enable_starttls_auto => true,
    :user_name => "L4NC3L0G4NW0LFST41N@gmail.com",
    :password => "92013105083"
}