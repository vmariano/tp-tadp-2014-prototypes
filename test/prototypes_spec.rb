require_relative '../src/prototyped_object'

describe 'Prototypes Attributes' do

  it 'Prototypes can add properties' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:energia, 100)
    expect(guerrero.energia).to eq(100)
  end

  it 'Prototypes can change his values' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:energia, 100)

    guerrero.energia= 200
    expect(guerrero.energia).to eq(200)
  end

end