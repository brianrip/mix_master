FactoryGirl.define do
  factory :artist do
    name
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  sequence :title, ["A", "C", "B"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title #{Faker::Book.title}
    artist #{Faker::Name.last_name}
  end
end
# FactoryGirl.define do
#  factory :song do
#    title   Faker::Book.title
#  end
# ​
#  factory :artist do
#    name         Faker::Name.name
#    image_path   "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
#  end
# ​
#  factory :artist_with_songs, :parent => :artist do |artist|
#    artist.after(:create) do |artist|
#      artist.songs << FactoryGirl.create(:song)
#    end
#  end
