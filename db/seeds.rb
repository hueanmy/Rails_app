User.create!(name: "mai", email: "ltmai93@gmail.com",
  password: "111111", password_confirmation: "111111", admin: true,
  activated: true, activated_at: Time.zone.now)

30.times do |n|
  name  = Faker::Name.name
  email = "mai-#{n+1}@gmail.com"
  password = "111111"
  User.create!(name:  name, email: email, password: password,
    password_confirmation: password, activated: true,
    activated_at: Time.zone.now)
end
