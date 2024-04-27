import golosinas.*

object mariano {

	const property bolsaDeGolosinas = #{}
	const golosinasDesechadas = #{}

	method comprar(unaGolosina) {
		bolsaDeGolosinas.add(unaGolosina)
	}

	method desechar(unaGolosina) {
		bolsaDeGolosinas.remove(unaGolosina)
		golosinasDesechadas.add(unaGolosina)
	}

	method cantidadDeGolosinas() {
		return bolsaDeGolosinas.size()
	}

	method tieneLaGolosina(unaGolosina) {
		return bolsaDeGolosinas.contains(unaGolosina)
	}

	method probarGolosinas() {
		bolsaDeGolosinas.forEach({ golosina => golosina.mordisco()})
	}

	method hayGolosinaSinTACC() {
		return bolsaDeGolosinas.any({ golosina => golosina.libreDeGluten() })
	}

	method preciosCuidados() {
		return bolsaDeGolosinas.all({ golosina => self.esGolosinaConPrecioCuidado(golosina) })
	}

	method esGolosinaConPrecioCuidado(golosina) {
		return golosina.precio() <= 10
	}

	method golosinaDeSabor(unSabor) {
		return bolsaDeGolosinas.find({ golosina => self.golosinaEsDeSabor(golosina, unSabor) })
	}

	method golosinaEsDeSabor(golosina, unSabor) {
		return golosina.gusto() == unSabor
	}

	method golosinasDeSabor(unSabor) {
		return bolsaDeGolosinas.filter({ golosina => self.golosinaEsDeSabor(golosina, unSabor) })
	}

	method sabores() {
		return bolsaDeGolosinas.map({ golosina => golosina.gusto() }).asSet()
	}

	method golosinaMasCara() {
		return bolsaDeGolosinas.find({ golosina => self.golosinaCuesta(golosina, self.precioMasGrande()) })
	}

	method golosinaCuesta(golosina, precio) {
		return golosina.precio() == precio
	}

	method precioMasGrande() {
		return bolsaDeGolosinas.map({ golosina => golosina.precio() }).max()
	}

	method pesoGolosinas() {
		return bolsaDeGolosinas.sum({ golosina => golosina.peso() })
	}

	method golosinasFaltantes(golosinasDeseadas) {
		return golosinasDeseadas.asSet().difference(bolsaDeGolosinas)
	}

	method gustosFaltantes(gustosDeseados) {
		return gustosDeseados.asSet().difference(self.sabores())
	}

	// Items desafío
	method gastoEn(sabor) {
		return self.golosinasDeSabor(sabor).sum({ golosina => golosina.precio() })
	}

	method saborMasPopular() {
		return self.sabores().find({sabor => self.esElDeMayorCantidad(sabor)})
	}
	
	method esElDeMayorCantidad(unSabor) {
		return self.cuantasGolosinasHay(unSabor) == self.mayorCantidadDeSaborEnBolsa()
	}
	
	method mayorCantidadDeSaborEnBolsa() {
		return self.sabores().map({sabor => self.cuantasGolosinasHay(sabor)}).max()
	}

	method cuantasGolosinasHay(unSabor) {
		return self.golosinasDeSabor(unSabor).size()
	// return bolsaDeGolosinas.count({ golosina => self.golosinaEsDeSabor(golosina, unSabor) })
	}

	method saborMasPesado() {
		return self.sabores().find({sabor => self.esElSaborMasPesado(sabor)})
	}

	method esElSaborMasPesado(unSabor) {
		return self.pesoDeGolosinas(unSabor) == self.pesoMaximoPorSaborEnBolsa()
	}

	method pesoDeGolosinas(unSabor) {
		return self.golosinasDeSabor(unSabor).sum({ golosina => golosina.peso() })
	}
	
	method pesoMaximoPorSaborEnBolsa() {
		return self.sabores().map({sabor => self.pesoDeGolosinas(sabor)}).max()
	}
	


}

