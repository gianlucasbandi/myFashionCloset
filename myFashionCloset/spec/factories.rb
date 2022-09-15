FactoryBot.define do

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
      user_id {@user.id}
    end

    factory :outfit do
      name {"Outfit elegante"}
      description {"Outfit da sera"}
      creator_id {@creator.id}
    end

end

