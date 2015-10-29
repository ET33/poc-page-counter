class News < ActiveRecord::Base
  include FriendlyId
  friendly_id :name

  validates_presence_of :name, :text

  private

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
