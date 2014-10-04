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

  it 'Prototypes can add behavior' do

    guerrero = PrototypedObject.new
    guerrero.set_property(:energia, 100)

    guerrero.set_property(:potencial_defensivo, 10)
    guerrero.set_property(:potencial_ofensivo, 30)

    guerrero.set_method(:atacar_a, proc {
        |otro_guerrero|

        if otro_guerrero.potencial_defensivo < self.potencial_ofensivo
          otro_guerrero.recibe_danio(self.potencial_ofensivo - otro_guerrero.potencial_defensivo)
        end
    })

    guerrero.set_method(:recibe_danio, proc {
        |danio|
      self.energia= self.energia - danio
    })

    otro_guerrero = guerrero.clone #clone es un metodoguerrero.atacar_a otro_guerrero
    guerrero.atacar_a(otro_guerrero)
    expect(otro_guerrero.energia).to eq(80)
  end

end
