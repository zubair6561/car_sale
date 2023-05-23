class Car < ApplicationRecord

  include PgSearch::Model
  attr_accessor :form_step
  multisearchable against: %i[car_model city price engine_detail transmission_type color milage
                              engine_capacity assembly_type]
  cattr_accessor :form_steps do
    %w(details images contacts)
  end
  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?
  
    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end
  validates :price, :milage, presence: true,
		  if: -> { required_for_step?(:details) }

end
