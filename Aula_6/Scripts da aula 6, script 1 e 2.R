######################################################
# Introdução Linguagem R
# Amanda Cavalcante Silva
# Universidade Federal da Bahia
#####################################################


# uma funÃ§Ã£o 

media <- function(x)
{
  soma=sum(x)
  nobs=length(x)
  media=soma/nobs
  return(media)
}


ls() # lista tudo que esta no ambiente de trabalho
media # mostra o que esta dentro do objeto media, que no caso e a funcao (x)
media()
dados=rnorm(20,2,1) # criando um objeto com um intervalo de 1 a 20, com 2 de media e 1 de desvio padrao
media(dados) # mostra a media do objeto dados
dados1=rnorm(200,2,1) # cria um objeto (dados1) com um intervalo de 1 a 200, media=2 e desvio=1
media(dados1) # da a media do objeto dados1
dados2=(rnorm(10000,2,1)) # cria o objeto dados2, com intervalo 1:10000, media=2 e desvio=1
media(dados2) # media de dados2
sd(dados) # desvio padrao do objeto dados
dados3=rnorm(20,2,0.01) # cria o objeto dados3, com intervalo de 1:20, media=2 e desvio=0.01
media(dados3) # media de dados3
dados4=rnorm(200,2,0.01) # cria o objeto dados4, com intervalo 1:200, media=2 e desvio = 0.01
media(dados4) # media de dados4
dados[2]<-NA # acrescenta NA na posicao 2
dados # chama dados
media(dados) # media de dados 


#outra funcao que retira os valores de NA

media<-function(x,rmNA=TRUE)  
{
  if(rmNA==TRUE)
  {
    dados=(na.omit(x))
    n.NA=length(x)-length(dados)
    cat("\t", n.NA," valores NA excluÃ�dos\n")
  }
  else
  {
    dados=x
  }
  soma=sum(dados)
  nobs=length(dados)
  media=soma/nobs
  return(media)
}

media(dados) # da a media de dados

# uma funcao para calcular variancia

var.curso<-function(x)
{
  media=media(x)
  dados=na.omit(x)	
  disvquad=(dados-media)^2
  var.curso=sum(disvquad)/(length(dados)-1)
  return(var.curso)
}


var.curso(dados) # calcula a variancia do objeto dados
var(dados)### dica: veja o help dessa funÃ§Ã£o "help(var)" ?help(var) 
var(dados,na.rm=TRUE) # da a variancia de dados, sem NA
var(dados,na.rm=FALSE) # nao removeu NA, por isso nao rodou 

# funcao que calcula o indice de dispersao  

ID.curso<-function(x)
{
  id=var.curso(x)/media(x)
  return(id)
}

aleat=rpois(200,2) # cria um objeto com intervalo de 1:200, com lambda=2
aleat # chama o objeto

unif=runif(200,0,4) # cria um objeto de 1:200, media=0, desvio=4
unif # chama o objeto unif
unif=round(unif,0) # aproxima ou arredonda os valores para numeros inteiros
unif # chama o objeto

agreg=round(c(runif(100,0,1),runif(100,5,10))) # cria um objeto, agregando os valores 
agreg # chama o objeto

ID.curso(aleat) # calcula o coeficiente de dispersao do objeto aleat 

ID.curso(unif) # calcula o coeficiente de dispersao de unif

ID.curso(agreg) # calcula o coeficiente de dispersao de agreg


# FunÃ§Ã£o para criar o teste de signficÃ¢ncia do ID

test.ID <- function(x, nsim=1000)
{ 
  ID.curso=function(x){var(x)/mean(x)}# essa funÃ§Ã£o precisa das funcoes media e ID.curso
  dados=na.omit(x)
  ndados=length(dados)
  med=mean(dados)
  id=var(dados)/med
  simula.aleat=rpois(length(dados)*nsim, lambda=med)
  sim.dados=matrix(simula.aleat,ncol= ndados)
  sim.ID=apply(sim.dados,1,ID.curso)
  quant.ID=quantile(sim.ID, probs=c(0.025,0.975))
  if(id>=quant.ID[1] & id<=quant.ID[2])
  { 
    cat("\n\n\n\t distribuiÃ§Ã£o aleatÃ³ria para alfa=0.05 \n\t ID= ",id,"\n\n\n")
  }
  if(id < quant.ID[1]) 
  { 
    cat("\n\n\n\t distribuiÃ§Ã£o uniforme, p<0.025 \n\t ID= ",id,"\n\n\n")
  }
  if(id>quant.ID[2])
  { 
    cat("\n\n\n\t distribuiÃ§Ã£o agregado, p>0.975 \n\t ID= ",id,"\n\n\n")
  }
  resulta=c(id,quant.ID)
  names(resulta)<-c("Indice de DispersÃ£o", "critico 0.025", "critico 0.975")
  return(resulta)
}


test.ID(aleat) # testa os dados simulados do objeto aleat
test.ID(agreg) # testa os dados simulados de agreg
test.ID(unif) # testa os dados simulados de unif

# funcao que plota um grafico em tamanho 2x2 e um histograma

eda.shape <- function(x)
{
  x11() # plota
  par(mfrow = c(2,2))	## muda o dispositivo grÃ¡fico para 2x2
  hist(x)                 ## produz histograma de x
  boxplot(x) # grafico padrao para variaveis categoricas
  iqd <- summary(x)[5] -	summary(x)[2]     ## faz a diferenca entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l") # plota um grafico de densidade
  qqnorm(x) # plota um grafico de x que passa pelo primeiro e terceiro quartil
  qqline(x) # plota um grafico de x com dois conjuntos de dados
  par(mfrow=c(1,1)) # produz uma matriz 
  
}

## Executando a função modificada
eda.shape1(rnorm(500,6))



## Fazendo ciclos de operações
x1=rpois(20,1) # operacao com n=20 e lambda=1 
x2=rpois(20,2) # n=20 e lambda ou valor medio = 2
x3=rpois(20,3) # n=20 e lambda = 3
x4=rpois(20,1) # n=20 e lambda=1
sp.oc=matrix(c(x1,x2,x3,x4), ncol=4) #criou uma matriz de x1, x2, x3 e x4, com 4 linhas
colnames(sp.oc)<-c("plot A", "plot B", "plot C", "plot D") # nomeou os nomes das colunas como plot A, B, C e D
rownames(sp.oc)<-paste("sp", c(1:20)) # nomeou os nomes das linhas como sp de 1 até 20
str(sp.oc) # mostra o objeto sp.oc
dim(sp.oc) # mostra a dimensão do objeto sp.oc
head(sp.oc) # mostra a primeira parte do objeto sp.oc


## Funcao para contar especies por parcelas

n.spp<-function(dados)
{
  nplot=dim(dados)[2]
  resultados=rep(0,nplot)
  names(resultados)<-paste("n.spp", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:(dim(dados)[2]))
  {
    cont.sp=sum(dados[,i])
    resultados[i]=cont.sp
  }
  return(resultados)
}


##### Aplicando a função 

n.spp(sp.oc)

## Funcao de similaridade

sim<-function(dados)
{
  nplot=dim(dados)[2]
  similar=matrix(1,ncol=nplot,nrow=nplot)
  rownames(similar)<-paste("plot", c(1:nplot))
  colnames(similar)<-paste("plot", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:nplot-1)
  {
    m=i+1
    for(m in m:nplot)
    {
      co.oc=sum(dados[,i]>0 & dados[,m]>0)
      total.sp=sum(dados[,i])+sum(dados[,m])-co.oc
      similar[i,m]=co.oc/total.sp 
      similar[m,i]=co.oc/total.sp 
    }
    
  }
  return(similar)
}


#### Exercícios 9 - Construção de Funções


manda <- function(x, y){
  
  resulta <- (matrix(c(x, y), ncol = 2))
  
  if(length(x) == length(y)){
  
  }
  
  hist(x)
  hist(y)
  
  
  return(resulta)
}

