# == Schema Information
#
# Table name: guestbooks
#
#  id         :integer          not null, primary key
#  visitor_id :integer
#  host_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Guestbook, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
