require 'spec_helper'

describe Beat do
  GENRE = ['Old School', 'Pop', 'Trap', 'Alternative', 'Electronic', 'Grime', 'Hip Hop', 'R&B', 'Nintendo']
  PRICE = [0.00, 0.99]

  it { should validate_presence_of(:beat) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:genre) }
  it { should validate_presence_of(:name) }
  it { should ensure_inclusion_of(:genre).in_array(GENRE)}

  it { should have_many(:tracks) }

end
