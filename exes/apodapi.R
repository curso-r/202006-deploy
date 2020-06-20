library(httr)

# Registrar em https://api.nasa.gov/
chave <- "JlgN91cBMQqATLqcrSWrDvLEhDZbbnPPkZrj1b9q"

# Parâmetros da requisição
params <- list(
  date = "2020-01-18",
  api_key = chave
)

# Requisição sem parâmetros
GET("https://api.nasa.gov/planetary/apod")

# Proibido
http_status(403)

# Agora vai
GET("https://api.nasa.gov/planetary/apod", query = params)

# Conteúdo
resposta <- GET("https://api.nasa.gov/planetary/apod", query = params)
conteudo <- content(resposta)

# Vendo a imagem
BROWSE(conteudo$url)
