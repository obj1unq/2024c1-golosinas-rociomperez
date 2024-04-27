import mariano.*

object bombon {

	var peso = 15
	const property precio = 5
	const property gusto = "frutilla"
	const property libreDeGluten = true

	method peso() {
		return peso
	}

	method mordisco() {
		peso = peso * 0.8 - 1
	}

}

object alfajor {

	var peso = 300
	const property precio = 12
	const property gusto = "chocolate"
	const property libreDeGluten = false

	method peso() {
		return peso
	}

	method mordisco() {
		peso = peso * 0.8
	}

}

object caramelo {

	var peso = 5
	const property precio = 1
	const property gusto = "frutilla"
	const property libreDeGluten = true

	method peso() {
		return peso
	}

	method mordisco() {
		peso -= 1
	}

}

object chupetin {

	var peso = 7
	const property precio = 2
	const property gusto = "naranja"
	const property libreDeGluten = true

	method peso() {
		return peso
	}

	method mordisco() {
		if (self.peso() > 2) {
			peso = peso * 0.9
		}
	}

}

object oblea {

	var peso = 250
	const property precio = 5
	const property gusto = "vainilla"
	const property libreDeGluten = false

	method peso() {
		return peso
	}

	method mordisco() {
		if (self.peso() > 70) {
			peso = peso * 0.5
		} else {
			peso = peso * 0.75
		}
	}

}

// GOLOSINAS EXTRAS
object chocolatin {

	var pesoInicial
	var peso
	const property gusto = "chocolate"
	const property libreDeGluten = false

	method pesoInicial(_pesoInicial) {
		pesoInicial = _pesoInicial
		peso = _pesoInicial
	}

	method peso() {
		return peso
	}
	
	method precio() {
		return pesoInicial * 0.5
	}

	method mordisco() {
		peso -= 2
	}

}

object golosinaBaniada {

	var property golosinaBase
	var pesoDelBaniado = 4
	var mordiscosAlBaniado = 0

	method pesoDelBaniado() {
		return pesoDelBaniado
	}

	method peso() {
		return golosinaBase.peso() + self.pesoDelBaniado()
	}

	method precio() {
		return golosinaBase.precio() + 2
	}

	method gusto() {
		return golosinaBase.gusto()
	}

	method libreDeGluten() {
		return golosinaBase.libreDeGluten()
	}

	method mordisco() {
		self.mordiscoDelBaniado()
		golosinaBase.mordisco()
	}

	method mordiscoDelBaniado() {
		if (mordiscosAlBaniado <= 2) {
			pesoDelBaniado -= 2
			mordiscosAlBaniado += 1
		}
	}

}

object pastillaTuttiFrutti {

	var property peso = 5
	var property libreDeGluten
	var cantidadDeMordisco = 0
	const property sabores = [ "frutilla", "chocolate", "naranja" ]
	var property gusto = "frutilla"

	method precio() {
		return if (self.libreDeGluten()) {
			7
		} else {
			10
		}
	}

	method mordisco() {
		if (cantidadDeMordisco < sabores.size()) {
			cantidadDeMordisco += 1
			gusto = sabores.get(cantidadDeMordisco)
		} else {
			gusto = sabores.get(0)
		}
	}
}






