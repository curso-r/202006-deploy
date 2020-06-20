
#* Ecoa uma mensagem
#* @param mensagem Um texto
#* @get /echo
echo <- function(mensagem = "") {
  paste0("A sua mensagem foi '", mensagem, "'")
}

#* Divide dois números
#* @param a O dividendo
#* @param b O divisor
#* @post /div
div <- function(a, b) {
  list(
    a = a,
    b = b,
    result = as.numeric(a)/as.numeric(b)
  )
}
