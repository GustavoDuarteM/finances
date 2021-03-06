# Table: monthly_operations
# id:                  integer
# name:                string
# value:               float
# date_of_operation:   date
# operation_type:      integer
# created_at:          datetime
# updated_at:          datetime

class MonthlyOperation < ApplicationRecord
  acts_as_paranoid
  belongs_to :recurring_operation, optional: true
  belongs_to :user

  validates :name, :date_of_operation, :operation_type, presence: true
  validates :value, numericality: { greater_than: 0 }

  enum operation_type: {
    onflows: 0,
    outflow: 1
  }

end
