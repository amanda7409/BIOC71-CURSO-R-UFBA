######################################################
# Introdução Linguagem R
# Amanda Cavalcante Silva
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72.3 # subtrai 72.3 de 34

# use pontos como separador de decimal. O que acontece se você usar virgula?

78 / 3 #divisao de 78 por 3
2 ^ 3 # exponencial de 2 elevado a 3 
3 * 2 # multiplicao de 3 por 2
sqrt(2)# raiz quadrada de 2
pi # valor de PI
log(x = 3,base = 10) # valor do log3 na base 10
exp(x = 1) # exponencial de 1 
#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui? # os valores que ficam dentro do parentese são os valores que serão calculados e o = é para associar o valor da direita ao da esquerda.

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 # objeto1
objeto1 # mostra o objeto1
objeto = 42 # objeto
objeto # chama o objeto
objeto.2 <- 42 # o 42 esta sendo relacionado ao 2
objeto.2 # mostra o objeto.2
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa? # são atribuidos como igualdade
objeto.cubico <- objeto^3 # mostra que as duas formas sao equivalente
resultado.1 <- (objeto.cubico / 3) + 7 # calculou o que esta dentro do parentese e esse por sua vez e o resultado1
objeto.texto <- "texto sempre vem entre aspas" # criou o objeto
objeto.texto # chama o objeto
objeto.texto.2 <- "42" = objeto

objeto.vetor.1 = 1:34 # cria um objeto de 1 a 34
objeto.vetor.1 # chama o objeto
objeto.vetor2 = c(1, 74.5, 48) # combinacao de numeros
objeto.vetor2 = chama o objeto

?seq # ajuda para seq
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) # sequência de 20 a 32 de 0.5 em 0.5...

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media
var(objeto.vetor3) #variancia
median(objeto.vetor3) #mediana
min(objeto.vetor3) #minimo
max(objeto.vetor3) #maximo
diff(objeto.vetor3) #calcula a diferenca entre os elementos sucessivos do vetor

# R também faz comparações entre objetos
42 > 7 # comparacao verdadeira
objeto == objeto.2 #verdadeira
objeto == objeto.texto.2 #verdadeira
# o que aconteceu acima?
7.1 <= 7.001 # comparacao falsa
?"<" #ajuda

#pedindo ajuda
?pi #ajuda do PI
?log #ajuda
??lm #ajuda
help(log) #ajuda
help.search("anova") #ajuda

#####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho? #usando getwd()

# Como você lista o conteúdo do diretório de trabalho?

# Como você define o diretório de trabalho? # diretorio de trabalho e aquele pelo qual voce iniciou o R

# Como você carrega um arquivo de script? # vai em file, posteriormente, open file e escolhe o script desejado

# Como você salva os objetos que criou? # salvando no disquete ou clicando no X (que fecha o RStudio) e em "save"

# Como você carrega os objetos que criou? # colocando o nome do objeto, assim voce pode visualiza-lo

# Como ver quis objetos estão na sua área de trabalho? #usando a funcao ls()

# Como remover objetos da área de trabalho? # pode-se utilizar, por exemplo, uma vassoura que tem pr?xima a "import dataset"

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo? Como consertar cada erro?
objetol # mostra que o objeto1 nao existe. Conserta-se criando um objeto1
objeto.texto # objeto.texto nao existe. E necessario criar um objeto.texto 
Objeto # o objeto nao existe / criar um objeto
source("chuchu.R") # erro no arquivo (nome do arquivo, "r", codificacao = codificacao) / para consertar o erro e preciso que o arquivo pelo qual deseja executar, seja carregado para o diretorio de trabalho usando o comando Carregar no RStudio.
source(chuchu.R) # erro: objeto nao encontrado / para consertar esse erro, e necessario que chuchu.R esteja entre aspas e esteja carregado no diretorio de trabalho
setwd("C:/CavernaDoDragão") # erro: nao e possivel alterar o diretorio de trabalho / para consertar o erro pode-se abrir Ferramenta> opcoes globais> geral
getwd # esse comando retorna o diretorio de trabalho anterior de forma invisivel
Getwd() # nao conseguiu encontrar uma funcao, para tornar possivel e necessario que seja adicionado a funcao dentro do parentese
#dica: quando o R der erro, copie e cole a mensagem de erro no google