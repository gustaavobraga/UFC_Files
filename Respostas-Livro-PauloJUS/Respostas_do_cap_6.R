# d calcula a densidade de probabilidade f (x) no ponto
# p calcula a função de probabilidade acumulada F (x) no ponto
# q calcula o quantil correspondente a uma dada probabilidade
# r retira uma amostra da distribuição

####### Capitulo 6 #######

# 1. Uma moeda viciada tem probabilidade de cara igual a 0.4. Para quatro lançamentosindependentes dessa moeda, estude o comportamento da variável número de caras e faça um gráfico de sua função de distribuição.

fx = dbinom(0:4,4,0.4);fx
Fx = pbinom(0:4,4,0.4);fx
plot(0:4,fx,type='S',col='red')
plot(0:4,Fx,type='S',col='blue')

# 2. Sendo X uma variável seguindo o modelo Binomial com parâmetro n=15 e p = 0.4, pergunta-se:
    n = 15;n
    p = 0.4;p
    # a. P(X ≥ 14)
    1-pbinom(13,n,p)

    # b. P(8 < X ≤ 10)
    pbinom(10,n,p)- pbinom(8,n,p)

    # c. P(X < 2 ou X ≥ 11)
    pbinom(1,n,p) + (1-pbinom(10,n,p))

    # d. P(X ≥ 11 ou X > 13)
    (1-pbinom(10,n,p)) + (1-pbinom(13,n,p))

    # e. P(X > 3 e X < 6) = P(3<X<6)
    pbinom(5,n,p) - pbinom(3,n,p)

    # f. P(X ≤ 13 | X ≥ 11) = P(11 ≤ X ≤ 13)/P(X ≥ 11)
    #P(X ≥ 11)
    p11 = 1 - pbinom(10,n,p); p11
    #P(11 ≤ X ≤ 13)
    intercessao = sum(dbinom(11:13,n,p)); intercessao

    resultado = intercessao/p11; resultado
# 3. Para X ∼ N (90, 100), obtenha:
    m = 90
    d = sqrt(100)
    # a. P(X ≤ 115)
    pnorm(115, m,d)

    # b. P(X ≥ 80)
    1 - pnorm(80,m,d)

    # c. P(X ≤ 75)
    pnorm(75, m, d)

    # d. P(85 ≤ X ≤ 110)
    pnorm(110, m, d) - pnorm(85, m, d)
    
    # e. P(|X − 90| ≤ 10) = P(-10 ≤ X-90 ≤ 10) = P(80 ≤ X ≤ 100)
    pnorm(100,m,d) - pnorm(80,m,d)

    # f. O valor de a tal que P (90 − a ≤ X ≤ 90 + a) = γ, γ = 0.95
    # P(90 − a ≤ X ≤ 90 + a) = 0.95

    f = function(x) {
        #Vamos utilizar a função abs() que retorna o valor absoluto do número
        abs(0.95 - (pnorm(90+x,m,d) - pnorm(90-x,m,d))) 
    }
    optimise(f, c(0,150))
    #Logo arredondando o resultado temos que a = 19.6
    pnorm(90+19.6,m,d)-pnorm(90-19.6,m,d)
    
# 4. Faça os seguintes gráficos:

    # a. Da função de densidade de uma variável com distribuição de Poisson com parâmetro λ = 5
    fxp = dpois(1:15,5)
    plot(1:15, fxp, type="S")

    # b. Da densidade de uma variável X ∼ N (90, 100)
    fxn = dnorm(1:200,90,10)
    plot(1:200, fxn, type='S', col='red')

    # c. Sobreponha ao gráfico anterior a densidade de uma variável Y ∼ N (90, 80) e outra Z ∼ N (85, 100)

    x = seq(0, 130,len=10);x

    plot(x,xlim = c(0,140), ylim = c(0, 0.05), main = "Gráfico de densidade de distribuições Normais", xlab = 'x', ylab='Densidade de probabilidade')

    lines(x, dnorm(x,90,10), col='blue',lwd = 3,lty=1)
    lines(x, dnorm(x,90,sqrt(80)), col='red',lwd = 3, lty = 2)
    lines(x, dnorm(x,85, 10), col='purple', lwd = 3, lty=3)

    legend("bottomleft", legend = c("N(90,100)", "N(90,80)", "N(85,100)"), col = c("blue", "red", "purple"), lwd = 2, lty = 1:3)

    # d. Densidades de distribuições χ2 com 1, 2 e 5 graus de liberdade.
    x = seq(0,40, len=100);x
    plot(x,xlim = c(0,20), ylim=c(0,0.55),type='n', main = "Gráfico de densidade de distribuições Qui-Quadrado",xlab = 'x', ylab='Densidade de probabilidade')
    
    lines(x, dchisq(x,1), lwd = 4, lty = 1, col = 1)
    lines(x, dchisq(x,2), lwd = 4, lty = 2, col = 2)
    lines(x, dchisq(x,3), lwd = 4, lty = 3, col = 3)
    lines(x, dchisq(x,5), lwd = 4, lty = 3, col = 4)

    
    legend("topright", legend = c(
    bquote(paste(chi^2, " com ", .(1), " graus de liberdade") ),
    bquote(paste(chi^2, " com ", .(2), " graus de liberdade") ),
    bquote(paste(chi^2, " com ", .(3), " graus de liberdade") ),
    bquote(paste(chi^2, " com ", .(5), " graus de liberdade") )
    ), col = c(1:4), lwd = 2, lty = 1:4)

# 5.A probabilidade de indivı́duos nascerem com certa caracterı́stica é de 0,3. Para o nascimento de 5 indivı́duos e considerando os nascimentos como eventos independentes, estude o comportamento da variável número de indivı́duos com a caracterı́stica e faça um gráfico de sua função de distribuição.
    # X~B(5,0.3)
    fx = dbinom(0:5, 5, 0.3);fx
    sum(fx)
    Fx = pbinom(0:5, 5, 0.3);Fx

    plot(0:5, fx, type='l', lwd=5, lty=1, col=8, xlab='X',ylab='Densidade de probabilidade', main='Densidade da Variável X~B(5,0.3)')

# 6. Sendo X uma variável seguindo o modelo Normal com média µ = 130 e variância σ^2 = 64, pergunta-se:
    x = seq(-50,200,len=200);x
    mu = 130
    dp = sqrt(64)

    # a. P (X ≥ 120) = 1 - P(X ≤ 120)
    px1 = 1 - pnorm(120,mu,dp); px1

    # b. P (135 < X ≤ 145)
    px2 = pnorm(145,mu,dp) - pnorm(135,mu, dp);px2

    # c. P (X < 120 ou X ≥ 150)
    px3 = pnorm(120,mu,dp) + (1-pnorm(150,mu,dp));px3

# 7. (Ex 3.6, pag 65) Num estudo sobre a incidência de câncer foi registrado, para cada paciente com este diagnóstico o número de casos de câncer em parentes próximos (pais,irmãos, tios, filhos e sobrinhos). Os dados de 26 pacientes são os seguintes:

    # Estudos anteriores assumem que a incidência de câncer em parentes próximos pode ser modelada pela seguinte função discreta de probabilidades:
        # Incidência |  0   1   2   3   4   5
        #     p_i    | 0.1 0.1 0.3 0.3 0.1 0.1

        # Logo o valor esperado seguindo esse modelo teorico é e_i=26*p_i
        e_i = c(0.1, 0.1, 0.3, 0.3, 0.1, 0.1)*26;e_i

    # a. Os dados observados concordam com o modelo teórico?
    x = c(0:5)
    n_i = c(4,4,6,6,2,4);n_i #Frequencia dos valores de x
    sum(n_i)
    plot(x, n_i,type='h',lwd=6,col=2,ylab='Frequência')

    tabela = cbind(x,n_i,e_i); tabela
    #Não

    # b. Faça um gráfico mostrando as frequências teóricas (esperadas) e observadas.
    plot(x,type='n',ylim=c(1.8,8),ylab='Frequência',xlim=c(0,5))
    lines(x,n_i,lwd=6,col=4,type='p')
    lines(x,e_i,lwd=6,col=2,type='p')
    lines(x,n_i,lwd=3,col=4,lty=6)
    lines(x,e_i,lwd=3,col=2,lty=6)
    legend("topright", legend = c('Esperado','Observado'),lwd=6,col=c(2,4))


   

