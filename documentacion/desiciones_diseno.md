PRIMERA FORMA NORMAL

En vez de guardar una lista de huéspedes acompañantes se creo una tabla puente. adicionalmente los servicios consumidos se separaros en la tabla consumo, de esta manera cada registro es único

SEGUNDA FORMA NORMAL

En la tabla Consumo, los atributos cantidad y tarifa_aplicada dependen de id_reserva y id_servicio no solamente de reserva ni solamente de servicio, sino de el servicio especifico que consumió una reserva especifica.

TERCERA FORMA NORMAL

Esta se puede evidenciar en la separación que existe entre habitación y tipo_habitacion, si campos como capacidad o tarifa_base estuvieran dentro de la tabla habitación tendrían un tipo de dependencia, teniendo en cuenta que el precio depende del tipo de habitación. Por lo que al dejarlos separados se elimina esa redundancia y asi mismo se asegura que en dado caso que los precios cambien sin afectar directamente la tabla habitacion
