class Car < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[car_model city price engine_detail transmission_type color milage
                              engine_capacity assembly_type]
end
