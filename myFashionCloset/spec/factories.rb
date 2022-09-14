FactoryBot.define do

    factory :user, class: User do
      username {"esempio"}
      email {"esempio@gmail.com"}
      password {"Password1234"}
    end

end