/*  Archivo controllers/mascotas.js
 *  Simulando la respuesta de objetos Mascota
 *  en un futuro aquí se utilizarán los modelos
 */

// importamos el modelo de mascotas
/*const Mascota = require('../models/Mascota')

function crearMascota(req, res) {
  // Instanciaremos una nueva mascota utilizando la clase mascota
  var mascota = new Mascota(req.body)
  res.status(201).send(mascota)
}

function obtenerMascotas(req, res) {
  // Simulando dos mascotas y respondiendolas
  var mascota1 = new Mascota(1, 'Firulais', 'perro', 'http/dogs', 'negro y alto', 'Juan Perez', 'Toluca')
  var mascota2 = new Mascota(2, 'Miru', 'gato', 'http/cats', 'blanco y risueno', 'Hugo Torres', 'Metepec')
  res.send([mascota1, mascota2])
}*/

const mongoose = require('mongoose')
const Mascota = mongoose.model('Mascota')

function crearMascota(req, res, next) {
  var mascota = new Mascota(req.body)
  mascota.anunciante = req.usuario.id
  mascota.estado = 'disponible'
  mascota.save().then(mascota => {
    res.status(201).send(mascota)
  }).catch(next)
}


function obtenerMascotas(req, res, next) {
  if(req.params.id){
    Mascota.findById(req.params.id)
      .populate('anunciante', 'username nombre apellido bio foto').then(mascotas => {
        res.send(mascotas)
      }).catch(next)
  } else {
    Mascota.find().then(mascotas=>{
      res.send(mascotas)
    }).catch(next)
  }
}

// Actualizar hacia abajo


function modificarMascota(req, res) {
  // simulando una mascota previamente existente que el cliente modifica
  var mascota1 = new Mascota(req.params.id, 'Bola', 'perro', 'http/dogs', 'gris y alto', 'Juan Perez', 'Toluca')
  var modificaciones = req.body
  mascota1 = { ...mascota1, ...modificaciones }
  res.send(mascota1)
}

function eliminarMascota(req, res) {
  // se simula una eliminación de una mascota, regresando un 200
  res.status(200).send(`Mascota ${req.params.id} eliminada`);
}

// exportamos las funciones definidas
module.exports = {
  crearMascota,
  obtenerMascotas,
  modificarMascota,
  eliminarMascota
}
