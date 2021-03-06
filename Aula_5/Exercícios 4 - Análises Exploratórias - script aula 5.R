######################################################
# Introdução Linguagem R
# Amanda Cavalcante Silva
# Universidade Federal da Bahia
#####################################################



4.2 Cervejas

Uma amostra de 30 estudantes foi indagada sobre seu tipo de cerveja preferida, com o seguinte resultado

cervejas <-c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata")

Represente este resultado como um gráfico de barras e um dotplot (função dotchart).

cervejas.f = factor(cervejas)  # transformei em factor
cervejas.f   # chamei o objeto
barplot(table(cervejas.f)) # criei o gráfico de barras
dotchart(as.numeric(cervejas.f)) # criei o dotplot

Qual tem maior razão dado/tinta? # nesse caso o dotchart
  

4.3 Caixetais

Neste exercício, use o objeto caixeta, criado no tutorial Exploração de uma Variável Categórica.

caixeta = read.csv("caixeta.csv", sep= "," , dec=".")
str(tabcaixeta)
x11()

Construa um histograma do dap1) dos fustes dos caixetais.

hist(caixeta$fuste)# esse � um histograma da dap (fruste)

Construa histogramas da altura das árvores para os diferentes caixetais ('local').
Há diferenças entre as estruturas (distribuição de tamanhos) dos caixetais?

hist(caixeta$h[caixeta$local=="chauas"]) # histograma de chauas (local)
hist(caixeta$h[caixeta$local=="retiro"]) # hsistograma de retiro (local)
hist(caixeta$h[caixeta$local=="jureia"]) # hsistograma de jureia (local)
  
  
  
4.4 Eucaliptos

Neste exercício, use o conjunto de dados Inventário em Florestas Plantadas de Eucalyptus grandis.


eucalipto = read.table("eucalipto.php.csv", header=TRUE, sep=";", as.is=TRUE)
eucalipto
str(eucalipto)


Utilize o gráfico boxplot para analisar o DAP de árvores de E. grandis em função das variáveis região (regiao) e rotação (rotacao).

boxplot(eucalipto$dap~eucalipto$regiao)
boxplot(eucalipto$dap~eucalipto$rotacao)
par(mfrow=c(2,2))


Avalie a normalidade da altura do conjunto total de árvores com um gráfico quantil-quantil contra a distribuição normal.

barplot(eucalipto$ht)
hist(eucalipto$ht)
qqnorm(eucalipto$ht)
qqline(eucalipto$ht)


4.5 Mais Caixetais

Aqui usaremos novamente o objeto caixeta, criado no tutorial Explora��o de uma Vari�vel Categ�rica.

Analise a rela��o dap-altura ('dap' e 'h') em fun��o do caixetal (local) com a fun��o plot, mas somente para as �rvores 2) de caixeta (Tabebuia cassinoides).
Para a mesma rela��o do item anterior, verifique linearidade com a fun��o scatter.smooth
Utilizando o pacote lattice, analise a rela��o dap-altura ('dap' e 'h') em fun��o do caixetal (local), mas somente para as �rvores 3) de caixeta (Tabebuia cassinoides).

x11()
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"])
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])

scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"])
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])
