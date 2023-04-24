f1 = function(x){
    fx <- ifelse(x < 0, 0, 2*exp(-2*x))
    return(fx)
}

plot(f1)
plot(f1,0,10)
plot(f1,0,5)

integrate(f1,0,Inf)

plot(f1,0,5)
polygon(x=c(1,seq(1,5,l=20)), y=c(0,f1(seq(1,5,l=20))), density=10)
polygon(x=c(0.2,seq(0.2,0.8,l=20),0.8), y=c(0,f1(seq(0.2,0.8,l=20)), 0), col="gray")
text(c(1.2, 0.5), c(0.1, 0.2), c(expression(p[b],p[c])))

f2 = function(x) {
    fx = ifelse( x>=0 & x<1, (2/3)*x,
        ifelse(x>=1 & x<3, -(x/3) + 1, 0))
    return(fx)
}
integrate(f2,0,3)
plot(f2,-1,4)
    
integrate(f2,1.5,Inf)

ef2 = function(x) {x*f2(x)}

integrate(ef2, 0,3)
30*integrate(ef2, 0,3)$value

f = function(x) {
    #Vamos utilizar a função abs() que retorna o valor absoluto do número
    abs(0.95 - integrate(f2,0,x)$value) 
}
optimise(f, c(0,3))

integrate(f2 ,0, 2.4522)

# 1. (Bussab & Morettin, 5a edição, pag. 194, ex. 28) Em uma determinada localidade a distribuição de renda, em u.m. (unidade monetária) é uma variável aleatória X com função de distribuição de probabilidade:
    fx = function(x) {
        f = ifelse(x>=0 & x<=2, (1/10)*(x+1), 
            ifelse(x>2 & x<=6, -(3/40)*x + (9/20), 0))
        return(f)
    }

    # a. Mostre que f(x) é uma f.d.p..
        plot(fx)
        plot(fx, -10,10)
        #Vemes então que a função assume valores positivos no intevalo de (0,-Inf)

        # E sua integral é 1 no intevalo
        integrate(fx, 0,6)

    # b. Calcule os quartis da distribuição.
        q1 = function(x) {
            abs(0.25 - integrate(fx,0,x)$value)
        }
        q2 = function(x) {
            abs(0.50 - integrate(fx,0,x)$value)
        }
        q3 = function(x) {
            abs(0.75 - integrate(fx,0,x)$value)
        }
        optimise(q1,c(0,6))
        # R. 1.44951
        optimise(q2,c(0,6))
        # R. 2.348505
        optimise(q3,c(0,6))
        # R. 3.417999

    # c. Calcule a probabilidade de encontrar uma pessoa com renda acima de 4,5 u.m. e indique o resultado no gráfico da distribuição.
    # P(X>=4.5) = 1 -P(X<4.5)
        1 - integrate(fx,0,4.5)$value
        integrate(fx,4.5,Inf)$value
        # R. 0.08437404

        plot(fx, -1,7)
        abline(v=2,col='red')
        x = c(4.5, 4.5,6)
        y = c(0, fx(4.5),fx(6))
        polygon(x,y,density=15)

        text(c(5.2), c(0.01), 'P(X>=4.5)',cex=1.7, col='red')
