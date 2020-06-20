library(httr)

# Errando endpoint
GET("https://pokeapi.co/api/v2/naoexiste/charizard")

# Errando pokemon
GET("https://pokeapi.co/api/v2/pokemon/naoexiste")

# Não encontrado
http_status(404)

# Erro interno
http_status(500)

# Agora vai
GET("https://pokeapi.co/api/v2/pokemon/charizard")

# Sucesso
http_status(200)

# Uma zuerinha
http_status(418)

# Extraíndo o conteúdo
resposta <- GET("https://pokeapi.co/api/v2/pokemon/charizard")
conteudo <- content(resposta)
str(conteudo)
names(conteudo)

# Acessando a lista
conteudo$moves[[1]]$move$name
purrr::map(conteudo$moves, purrr::pluck, "move", "name")
