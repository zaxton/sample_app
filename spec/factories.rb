# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name         "Zach Easley"
  user.email        "zach1@example.com"
  user.password     "foobar"
  user.password_confirmation    "foobar"
end

# Creates many sample emails
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

# "Fills in" a micropost and states that micropost belongs to user
Factory.define :micropost do |micropost|
micropost.content "foo bar"
micropost.association :user
end
