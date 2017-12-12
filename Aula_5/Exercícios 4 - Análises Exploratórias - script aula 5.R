######################################################
# IntroduÃ§Ã£o Linguagem R
# Amanda Cavalcante Silva
# Universidade Federal da Bahia
#####################################################



4.2 Cervejas

Uma amostra de 30 estudantes foi indagada sobre seu tipo de cerveja preferida, com o seguinte resultado

cervejas <-c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata")

Represente este resultado como um grÃ¡fico de barras e um dotplot (funÃ§Ã£o dotchart).

cervejas.f = factor(cervejas)  # transformei em factor
cervejas.f   # chamei o objeto
barplot(table(cervejas.f)) # criei o grÃ¡fico de barras
dotchart(as.numeric(cervejas.f)) # criei o dotplot

Qual tem maior razÃ£o dado/tinta? # nesse caso o dotchart
  

4.3 Caixetais

Neste exercÃ­cio, use o objeto caixeta, criado no tutorial ExploraÃ§Ã£o de uma VariÃ¡vel CategÃ³rica.

caixeta = read.csv("caixeta.csv", sep= "," , dec=".")
str(tabcaixeta)
x11()

Construa um histograma do dap1) dos fustes dos caixetais.

hist(caixeta$fuste)# esse é um histograma da dap (fruste)

Construa histogramas da altura das Ã¡rvores para os diferentes caixetais ('local').
HÃ¡ diferenÃ§as entre as estruturas (distribuiÃ§Ã£o de tamanhos) dos caixetais?

hist(caixeta$h[caixeta$local=="chauas"]) # histograma de chauas (local)
hist(caixeta$h[caixeta$local=="retiro"]) # hsistograma de retiro (local)
hist(caixeta$h[caixeta$local=="jureia"]) # hsistograma de jureia (local)
  
  
  
4.4 Eucaliptos

Neste exercÃ­cio, use o conjunto de dados InventÃ¡rio em Florestas Plantadas de Eucalyptus grandis.


eucalipto = read.table("eucalipto.php.csv", header=TRUE, sep=";", as.is=TRUE)
eucalipto
str(eucalipto)


Utilize o grÃ¡fico boxplot para analisar o DAP de Ã¡rvores de E. grandis em funÃ§Ã£o das variÃ¡veis regiÃ£o (regiao) e rotaÃ§Ã£o (rotacao).

boxplot(eucalipto$dap~eucalipto$regiao)
boxplot(eucalipto$dap~eucalipto$rotacao)
par(mfrow=c(2,2))


Avalie a normalidade da altura do conjunto total de Ã¡rvores com um grÃ¡fico quantil-quantil contra a distribuiÃ§Ã£o normal.

barplot(eucalipto$ht)
hist(eucalipto$ht)
qqnorm(eucalipto$ht)
qqline(eucalipto$ht)


4.5 Mais Caixetais

Aqui usaremos novamente o objeto caixeta, criado no tutorial Exploração de uma Variável Categórica.

Analise a relação dap-altura ('dap' e 'h') em função do caixetal (local) com a função plot, mas somente para as árvores 2) de caixeta (Tabebuia cassinoides).
Para a mesma relação do item anterior, verifique linearidade com a função scatter.smooth
Utilizando o pacote lattice, analise a relação dap-altura ('dap' e 'h') em função do caixetal (local), mas somente para as árvores 3) de caixeta (Tabebuia cassinoides).

x11()
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"])
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])
plot(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])

scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="chauas"])
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="retiro"])
scatter.smooth(caixeta$cap[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"]~caixeta$h[caixeta$especie=="Tabebuia cassinoides" & caixeta$local=="jureia"])
