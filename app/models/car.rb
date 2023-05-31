class Car < ApplicationRecord
  belongs_to :user
  has_one :post, dependent: :destroy
  has_many_attached :images
  attribute :closed, :boolean, default: false
  include PgSearch::Model
  attr_accessor :form_step
  # validate :validate_image_count
  validates :images, presence:true , on: 'images'

  multisearchable against: %i[car_model city price engine_detail transmission_type color milage
                              engine_capacity assembly_type description image_data primary_contact secondary_contact]
  cattr_accessor :form_steps do
    %w(details images contacts)
  end
  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?
    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
    # return true if step == :images  && self.images.blank?
    false
  end

  validates :price, :milage, presence: true, numericality: { only_integer: true, message: "should be a valid integer" },
  if: -> { required_for_step?(:details) }
      validates :primary_contact, presence: true,
      format: { with: /\A\+92-\d{3}-\d{7}\z/, message: "should be in the +92 format"} ,
      if: -> { required_for_step?(:contacts) }
    
    
  def validate_image_count
    return unless images.attached? 
    if images.length > 5
      errors.add(:images, "can't upload more than 5 images")
      images.purge # Remove any extra uploaded images
    end
  end
end



