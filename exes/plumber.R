library(plumber)
library(httr)

# Criar API
api <- plumb("exes/endpoints.R")

# Roda API
api$run(port = 8000)

# A sessão vai ficar parada! Abrir outra

# Fazer requisição
params <- list(mensagem = "Funcionou!")
resposta <- GET("http://localhost:8000/echo", query = params)

# Conteúdo
content(resposta)[[1]]

# Portas
80   # HTTP
443  # HTTPS
143  # Email
8000 # Exemplo

# Fazer requisição (errado)
params <- list(a = 6, b = 2)
resposta <- POST("http://localhost:8000/div", body = params)

# Fazer requisição (certa)
params <- list(a = 6, b = 2)
resposta <- POST("http://localhost:8000/div", body = params, encode = "json")

# Conteúdo
conteudo <- content(resposta)
conteudo$a
conteudo$b
conteudo$result
