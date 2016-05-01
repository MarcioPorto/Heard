class Ability
  include CanCan::Ability

  def initialize(user)
    # If the user's phone number is blocked, they can't create or update items
    cannot [:create, :update], [Report, Answer] do
      BlockedPhoneNumber.all.include? user.phone_number
    end
    can [:read, :create], [Report, Answer]
    can [:update, :destroy], [Report, Answer] do |res|
      res.user == user
    end
    cannot [:create, :update, :destroy], [Category]
    can [:read], [Category]
  end
end
