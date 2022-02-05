# Datensatz einlesen
heart.data <- read.csv("https://raw.githubusercontent.com/statistical-thinking/datasets/main/heart.data.csv")

# Univariate Statistik
dim(heart.data)
summary(heart.data)
boxplot(heart.data)

# Univariate Statistik -> Verteilungsfunktion und Lagemaße
hist(heart.data$heart.disease, freq=FALSE, breaks=40, ylim=c(0,0.10), xlim=c(-5,26))
curve(dnorm(x, mean=mean(heart.data$heart.disease), sd=sd(heart.data$heart.disease)), add=TRUE, lwd=5)
abline(v=10.17, col="red")   # Mean
abline(v=10.38, col="green") # Median
abline(v=6.75, col="blue")   # Modus
legend(19, 0.1, legend=c("Mean", "Median", "Modus"), col=c("red", "green", "blue"), lty=1)

# Univariate Statstik -> Varianz und Standardabweichung (Teil 1)
var(heart.data$heart.disease)
sd(heart.data$heart.disease)

# Univariate Statstik -> Varianz und Standardabweichung (Teil 2)
hist(heart.data$heart.disease, freq=FALSE, breaks=40, ylim=c(0,0.10), xlim=c(-5,26))
curve(dnorm(x, mean=mean(heart.data$heart.disease), sd=sd(heart.data$heart.disease)), add=TRUE, lwd=5)
abline(v=5.6, col="red")   # Untere Grenze (68 %)
abline(v=14.74, col="red") # Obere Grenze (68 %)
abline(v=1.03, col="green")   # Untere Grenze (95 %)
abline(v=19.31, col="green") # Obere Grenze (95 %)
legend(20, 0.1, legend=c("68 %", "95 %"), col=c("red", "green"), lty=1)

# Bivariate Statistik -> Korrelation (Teil 1)
cor(heart.data)

# Bivariate Statistik -> Korrelation (Teil 2)
plot(heart.data$heart.disease~heart.data$biking)
abline(lm(heart.data$heart.disease~heart.data$biking), col="green")

# Bivariate Statistik -> Chi-Quadrat-Test
nominal_y <- ifelse(heart.data$heart.disease > 10.17, 1, 0) # Überdurchschnittlich viele Erkrankungen
nominal_x <- ifelse(heart.data$smoking > 15.43, 1, 0) # Überdurchschnittlich hohes Rauchverhalten
table(nominal_y, nominal_x)
chisq.test(nominal_y, nominal_x)

# Bivariate Statistik -> t-Test (Teil 1)
low_smoking_areas <- subset(heart.data, heart.data$smoking < 15.43)
high_smoking_areas <- subset(heart.data, heart.data$smoking > 15.43)
par(mfrow=c(1,2))
boxplot(low_smoking_areas[c(3)], ylim=c(0, 22), main="Low Smoking Areas (0)")
boxplot(high_smoking_areas[c(3)], ylim=c(0, 22), main="High Smoking Areas (1)")

# Bivariate Statistik -> t-Test (Teil 2)
t.test(heart.data$heart.disease~nominal_x)

# Multivariate Statistik (Teil 1)
(lm(heart.disease~biking, data=heart.data))
plot(heart.data$heart.disease~heart.data$biking)
abline(lm(heart.data$heart.disease~heart.data$biking), col="green")
(lm(heart.disease~biking+smoking, data=heart.data))

# Multivariate Statistik (Teil 2)
reg1 <- (lm(heart.disease~., data=heart.data))
summary(reg1)
plot(reg1$residuals)

# Multivariate Statistik (Teil 3)
nominal_y <- ifelse(heart.data$heart.disease > 10.17, 1, 0)
plot(nominal_y~heart.data$biking)
reg2 <- glm(nominal_y~heart.data$biking, family=binomial)
summary(reg2)