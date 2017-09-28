# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r = Random.new

DESCRIPTIONREPORT = [
    "Compas se acaban de robar esta bibicleta, por los lados de la av ciudad de cali, por el rincón de suba, frente al juan amarillo, tres costeños con cuchillos, te bajan de una patada de la bicicleta, te roban todo y no felices con ellos te lastiman para no poder seguirlos, he visto el mismo tipo de hurto en muchas ocasiones por el mismo sector, en las horas de la mañana, tengan mucho cuidado, siempre son los mismos usan una chaqueta de vigilancia tienen azotado el sector",
    "Buenos Días chicos El día de ayer a las 2pm me robaron la bici en el 20 de julio.Esta es la única foto que le alcancé a tomar (ni siquiera la estrené) . El marco es craquelado morado, y una coraza es rosada y la otra morada.",
    "Buen dia me robaron mi bici a eso de la 1 pm estaba estacionada frente al lugar donde trabajo en la Caracas con 70 junto a la Escuela de Artes y letras y rompieron la guaya.",
    "Me la robaron el sábado 23 de sep, en el puente de la 100 con autonorte, a mano armada. Para que estén pendientes al rodar por ahí muchachos",
    "Me la robaron al frente del Corral San Martin, en un segundo cortaron la cadena a plena luz del dia. RATAS. Moraleja, hay que comprar una cadena acorde con el valor de la bicicleta."
    ]
    
100.times do
    Report.create([{
        date: Faker::Date.backward(14),
        hour: Faker::Time.forward(23, :morning),
        description: DESCRIPTIONREPORT[r.rand(5)],
        type_report_id: 1,
        user_id: 1,
        mode_id: 1,
        bycicle_id: 1
    }])
end

100. times do |i|
    Site.create([{
        name: "Sitio",
        lat: Faker::Number.between(4.60000000000000, 4.70000000000000 ),
        lng: Faker::Number.between(-74.200000000000,-74.000000000000),
        report_id: i
        
    }])

end

