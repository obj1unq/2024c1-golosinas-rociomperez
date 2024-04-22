import golosinas.*

object mariano {
	
	const bolsaDeGolosinas = #{}
	
	method comprar(unaGolosina) {
		bolsaDeGolosinas.add(unaGolosina)
	}
	
	method desechar(unaGolosina) {
		bolsaDeGolosinas.remove(unaGolosina)
	}
	
	method cantidadDeGolosinas() {
		return bolsaDeGolosinas.size()
	}
	
	method tieneLaGolosina(unaGolosina) {
		return bolsaDeGolosinas.any({golosina => golosina == unaGolosina})
	}
	
	method probarGolosinas() {
		bolsaDeGolosinas.forEach({golosina => golosina.mordisco()})
	}
	
	method hayGolosinaSinTACC() {
		return bolsaDeGolosinas.any({golosina => golosina.libreDeGluten()})
	}
	
	method preciosCuidados() {
		return bolsaDeGolosinas.all({golosina => self.golosinaCuestaMenosOIgual(golosina, 10)})
	}
	
	method golosinaCuestaMenosOIgual(golosina, precio) {
		return golosina.precio() <= precio
	}

	method golosinaDeSabor(unSabor) {
		return bolsaDeGolosinas.find({golosina => self.golosinaEsDeSabor(golosina, unSabor) })
	}
	
	method golosinaEsDeSabor(golosina, sabor) {
		return golosina.sabor() == sabor
	}
	
	method golosinasDeSabor(unSabor) {
		return bolsaDeGolosinas.filter({golosina => self.golosinaEsDeSabor(golosina, unSabor)})
	}
	
	method sabores() {
		return bolsaDeGolosinas.filter({golosina => golosina.sabor()})
	}
	
	method golosinaMasCara() {
		return bolsaDeGolosinas.find({golosina => self.golosinaCuesta(golosina, self.precioMasGrande())})
	}
	
	method golosinaCuesta(golosina, precio) {
		return golosina.precio() == precio
	}
	
	method precioMasGrande() {
		return bolsaDeGolosinas.filter({golosina => golosina.precio()}).max()
	}
	
	method pesoGolosinas() {
		return bolsaDeGolosinas.sum({golosina => golosina.peso()})
	}
	
	method golosinasFaltantes(golosinasDeseadas) {
		return golosinasDeseadas.difference(bolsaDeGolosinas)
	}
	
	method gustosFaltantes(gustosDeseados) {
		return gustosDeseados.difference(self.sabores())
	}
	
	// Items desafío
	
	method gastoEn(sabor) {
		return self.golosinasDeSabor(sabor).sum({golosina => golosina.precio()})
	}
	
	method saborMasPopular() {
		
		
		
	}


	
}


