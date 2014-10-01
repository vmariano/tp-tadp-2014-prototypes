require_relative '../src/prototyped_object'

describe 'Prototypes behavior' do


  it 'Prototypes can add properties' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:energia, 100)
    expect(guerrero.energia).to eq(100)
  end

end