class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :score, :created_at, :user, :contest

  #has_one :user

  def user
    object.user.name
  end

  def contest
    object.contest.name
  end
  
end
