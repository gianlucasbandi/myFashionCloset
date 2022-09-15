FactoryBot.define do
  factory :saved_outfit do
    user_id { 1 }
    outfit_id { 1 }
  end


    factory :user do
      username {"esempio"}
      email {"esempio@gmail.com"}
      password {"Password1234"}
    end

    factory :creator do
      firstName {"CreatorName"}
      lastName {"CreatorLastName"}
      birthday {"2002-03-24"}
      styleDesc {"CreatorMessage"}
      approved {true}
      user_id {@user.id}
    end

end

