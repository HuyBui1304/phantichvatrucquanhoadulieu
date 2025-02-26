a <- as.integer(a)
class(a)
is.integer(a)
is.numeric(a)

b <- 6.89
class(b)
b <-as.integer(b)
b

### LOGICAL ###
#TRUE / FALSE
# T/F
# 1/0

a <-5; b<-3; c<-1
a+b+c

z = a < b
z
class(z)

# Logical operators in R:
# & (and) conjunction
# | (or) alternative
# !(not) negation


a <- TRUE
b <- FALSE
a & a
a & b
a | b
!a
!b

x <- (5 < 9) & (6 >= 5)
x

### CHARACTER ###

#Lưu trữ dữ liệu văn bản/ ký tự.
# Sử dụng "quotation"

a <- "z"
b <- " Le Nhat Tung"
class(a)
class(b)

c<-"9.66"
c
is.numeric(c)
d <- as.numeric(c)
d

d<-as.numeric("9.sau sau")
d

d <-as.numeric("9.66  ")
d

###DATE ###


date1 <- "2030-01-15"
class(date1)

date2 <-as.Date(date1)
class(date2)

as.numeric(date2)

datetam <- as.Date("2004-11-18")
as.numeric(datetam)

datehuy <- as.Date("2004-04-13")
as.numeric(datehuy)

todayFormatted <- format(today, format = "%d-%m-%Y"))
todayFormatted
