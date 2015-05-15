class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image, :score, :created_at, :user

  #has_one :user

  def user
    object.user.name
  end

  def image
    object.image.url
  end


  # def contest
  #   object.contest.name
  # end
  
end
