class Tag < ApplicationRecord

  has_many :taggings
  has_many :pins, through: :taggings

  def self.counts
    # self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
    all.each_with_object({}) { |t, memo| memo[t.name] = t.taggings.map(&:tag_id).count }

    # {"Fantasy"=>2, "Nature"=>1, "Animals"=>1, "Moto"=>1, "Space"=>1, "Romantice"=>1, "City"=>1}
  end
end
