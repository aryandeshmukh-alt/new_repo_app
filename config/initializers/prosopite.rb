return if Rails.env.test?

require "prosopite"

Prosopite.raise = true
Prosopite.rails_logger = true
Prosopite.prosopite_logger = true
