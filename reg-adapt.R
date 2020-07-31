adapt <- read.csv('C:/Users/tabakaev_mv/Desktop/ТМВ/МОИ ДАННЫЕ/АДАПТАЦИЯ РЕГИОНЫ/adapt_regions.csv', h = T, sep = ";", dec = ',')
View(adapt)

# ОТСЮДА НАЧИНАЕТСЯ "ЧИСТЫЙ" КОД


# 1 ЭТАП - Занесение базы данных (БД) по регионам РФ в среду R и ее грубая "очистка"

adapt <- read.csv('C:/Users/tabakaev_mv/Desktop/ТМВ/МОИ ДАННЫЕ/АДАПТАЦИЯ РЕГИОНЫ/adapt_regions.csv', h = T, sep = ";", dec = ',')

adapt <- read.csv('C:/Users/DNS/Desktop/работа/МОИ ДАННЫЕ/АДАПТАЦИЯ РЕГИОНЫ/adapt_regions.csv', h = T, sep = ";", dec = ',')

# проверяем правильность подгрузки информации посредством просмотра структуры БД
str(adapt)

# выводим в консоль верхнюю часть (англ. head - голова) БД (названия переменных и 4 наблюдения)
head(adapt)

# выводим в консоль нижнюю часть БД или "хвост" (англ. tail - хвост)
tail(adapt)

# предварительный просмотр датафрэйма
View(adapt)

# присваиваем названиям строк - названия регионов, т.к. единицой наблюдения у нас является регион РФ
names_regions <- c('Belgor', 'Bryansk', 'Vladimir', 'Voronezh', 'Ivanov', 'Kalug', 'Kostr', 'Kursk', 'Lipetzk', 'Mosk', 'Orlovsk', 'Ryazan', 'Smolensk', 'Tambovsk', 'Tver', 'Tulsk', 'Yarosl', 'Karel', 'Komi', 'Arhang', 'Vologods', 'Kaliningr', 'Leningr', 'Murmans', 'Novgor', 'Pskovsk', 'Dagestan', 'Ingush', 'KabardinBalk', 'KarachCherk', 'SevOsetAlan', 'Stavrop', 'Bashkort', 'MariyEl', 'Mordov', 'Tatar', 'Udmurt', 'Chuvash', 'Perm', 'Kirov', 'Nizhegor', 'Orenburg', 'Penzen', 'Samar', 'Sratov', 'Ulyanov', 'Kurgan', 'Sverdlovs', 'Tyumen', 'Chelyabin', 'RespAltay', 'Buryat', 'Tyva', 'Hakasiya', 'AltayskiyKray', 'Zabaykalsk', 'Krasnoyarsk', 'Irkutsk', 'Kemerov', 'Novosib', 'Omsk', 'Tomsk', 'Yakut', 'Primorsk', 'Habarovsk', 'Amur', 'Magadan', 'Sahalin', 'Evrey', 'Chukotsk', 'Adygeya', 'Kalmykiya', 'Krasnodar', 'Astrahan', 'Volgograd', 'Rostov')
rownames(adapt) <- names_regions

# "Чистим" БД: переименовываем переменные
names_stolb <- c('Region', 'Mort', 'Mort_1990', 'Mort_1995', 'Mort_1996', 'Mort_1997', 'Mort_1998', 'Mort_1999', 'Mort_2000', 'Mort_2001', 'Mort_2002', 'Mort_2003', 'Mort_2004', 'Mort_2005', 'Mort_2006', 'Mort_2007', 'Mort_2008', 'Mort_2009', 'Mort_2010', 'Mort_2011', 'Mort_2012', 'Mort_2013', 'Mort_2014', 'Mort_2015', 'OldPeople%InPop', 'Old_1995', 'Old_1996', 'Old_1997', 'Old_1998', 'Old_1999', 'Old_2000', 'Old_2001', 'Old_2002', 'Old_2003', 'Old_2004', 'Old_2005', 'Old_2006', 'Old_2007', 'Old_2008', 'Old_2009', 'Old_2010', 'Old_2011', 'Old_2012', 'Old_2013', 'Old_2014', 'Old_2015', 'norm_t_C_jan', 'norm_t_C_jule', 'Murders', 'Murd_1990', 'Murd_1995', 'Murd_1996', 'Murd_1997', 'Murd_1998', 'Murd_1999', 'Murd_2000', 'Murd_2001', 'Murd_2002', 'Murd_2003', 'Murd_2004', 'Murd_2005', 'Murd_2006', 'Murd_2007', 'Murd_2008', 'Murd_2009', 'Murd_2010', 'Murd_2011', 'Murd_2012', 'Murd_2013', 'Murd_2014', 'Murd_2015', '%_Pop_Salaries_Lower_of_Life_Min', 'PSLLM_1990', 'PSLLM_1995', 'PSLLM_1996', 'PSLLM_1997', 'PSLLM_1998', 'PSLLM_1999', 'PSLLM_2000', 'PSLLM_2001', 'PSLLM_2002', 'PSLLM_2003', 'PSLLM_2004', 'PSLLM_2005', 'PSLLM_2006', 'PSLLM_2007', 'PSLLM_2008', 'PSLLM_2009', 'PSLLM_2010', 'PSLLM_2011', 'PSLLM_2012', 'PSLLM_2013', 'PSLLM_2014', 'PSLLM_2015', 'Birth', 'Birth_1990', 'Birth_1995', 'Birth_1996', 'Birth_1997', 'Birth_1998', 'Birth_1999', 'Birth_2000', 'Birth_2001', 'Birth_2002', 'Birth_2003', 'Birth_2004', 'Birth_2005', 'Birth_2006', 'Birth_2007', 'Birth_2008', 'Birth_2009', 'Birth_2010', 'Birth_2011', 'Birth_2012', 'Birth_2013', 'Birth_2014', 'Birth_2015', 'Life_Exp_Y', 'Life_Exp_1990', 'Life_Exp_1991', 'Life_Exp_1992', 'Life_Exp_1993', 'Life_Exp_1994', 'Life_Exp_1995', 'Life_Exp_1996', 'Life_Exp_1997', 'Life_Exp_1998', 'Life_Exp_1999', 'Life_Exp_2000', 'Life_Exp_2001', 'Life_Exp_2002', 'Life_Exp_2003', 'Life_Exp_2004', 'Life_Exp_2005', 'Life_Exp_2006', 'Life_Exp_2007', 'Life_Exp_2008', 'Life_Exp_2009', 'Life_Exp_2010', 'Life_Exp_2011', 'Life_Exp_2012', 'Life_Exp_2013', 'Life_Exp_2014', 'Life_Exp_2015', '%_Bankrupt_Enterprises', '%_Waste_Ent_1990', '%_Waste_Ent_1995', '%_Waste_Ent_1996', '%_Waste_Ent_1997', '%_Waste_Ent_1998', '%_Waste_Ent_1999', '%_Waste_Ent_2000', '%_Waste_Ent_2001', '%_Waste_Ent_2002', '%_Waste_Ent_2003', '%_Waste_Ent_2004', '%_Waste_Ent_2005', '%_Waste_Ent_2006', '%_Waste_Ent_2007', '%_Waste_Ent_2008', '%_Waste_Ent_2009', '%_Waste_Ent_2010', '%_Waste_Ent_2011', '%_Waste_Ent_2012', '%_Waste_Ent_2013', '%_Waste_Ent_2014', '%_Waste_Ent_2015', 'Gen_Morbidity', 'Morbid_1990', 'Morbid_1995', 'Morbid_1996', 'Morbid_1997', 'Morbid_1998', 'Morbid_1999', 'Morbid_2000', 'Morbid_2001', 'Morbid_2002', 'Morbid_2003', 'Morbid_2004', 'Morbid_2005', 'Morbid_2006', 'Morbid_2007', 'Morbid_2008', 'Morbid_2009', 'Morbid_2010', 'Morbid_2011', 'Morbid_2012', 'Morbid_2013', 'Morbid_2014', 'Morbid_2015',' Fact_Loadings', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015')
# проверям длину вектора с именами переменных
length(names_stolb) == length(adapt)

# присваиваем новые имена переменным
colnames(adapt) <- names_stolb
View(adapt)

# "Чистим" БД: удаляем переменные (столбцы с пустыми значениями). Создаем полу-очищенный датафрэйм 'df_all'
df_all <- adapt[,c(1, 47:48, 26:46, 119:144, 3:24, 50:71, 74:94, 96:117, 147:167, 170:190)]

# "Чистим" БД: удаляем переменные (столбцы с населением старше трудоспос возраста, норму температуры и т.д.). Создаем полностью очищенный датафрэйм 'df'
df <- adapt[,c(4:24, 51:71, 74:94, 97:117, 147:167, 170:190)]
View(df)

# проверяем df на наличие пропущенных значений
a <- is.na(df)
View(a)
b <- apply(a, 2, sum)
View(b)

# таблица пропущенных значений по столбцам
table_NA <- sort(table(b))

str(df)

# завершение 1 ЭТАПА - грубой "очистки" БД

# проверка на нормальность распределения
p_val_shv <- sapply(df,function(x) shapiro.test(x)$p.value)
perem_nenorm <- p_val_shv < 0.05
length(df) - sum(perem_nenorm)

проверка на нормальность распределения стандартизированной БД
p_val_shv_1 <- sapply(df,function(x) shapiro.test(scale(x))$p.value)
perem_nenorm_1 <- p_val_shv_1 < 0.05
length(df) - sum(perem_nenorm_1)

# проверка на наличие выбросов и аномальных наблюдений - не обнаружено
summary(df)
a <- sapply(df, function(x)  x < mean(x) - sd(x)*5 | x > mean(x) + sd(x)*5)
a <- sapply(df, function(x)  x < mean(x) - sd(x)*3 | x > mean(x) + sd(x)*3)
View(a)

sapply(a,function(x) sum(na.rm = TRUE))

# БД очищена и проверена

# визуализация распределения переменных

# колонки переменных по годам
god_1995 <- c(T, rep(F,20))
df[god_1995]
god_1996 <- c(rep(F,1), T, rep(F,19))
df[god_1996]
god_1997 <- c(rep(F,2), T, rep(F,18))
df[god_1997]
god_1998 <- c(rep(F,3), T, rep(F,17))
df[god_1998]
god_1999 <- c(rep(F,4), T, rep(F,16))
df[god_1999]
god_2000 <- c(rep(F,5), T, rep(F,15))
df[god_2000]
god_2001 <- c(rep(F,6), T, rep(F,14))
df[god_2001]
god_2002 <- c(rep(F,7), T, rep(F,13))
df[god_2002]
god_2003 <- c(rep(F,8), T, rep(F,12))
df[god_2003]
god_2004 <- c(rep(F,9), T, rep(F,11))
df[god_2004]
god_2005 <- c(rep(F,10), T, rep(F,10))
df[god_2005]
god_2006 <- c(rep(F,11), T, rep(F,9))
df[god_2006]
god_2007 <- c(rep(F,12), T, rep(F,8))
df[god_2007]
god_2008 <- c(rep(F,13), T, rep(F,7))
df[god_2008]
god_2009 <- c(rep(F,14), T, rep(F,6))
df[god_2009]
god_2010 <- c(rep(F,15), T, rep(F,5))
df[god_2010]
god_2011 <- c(rep(F,16), T, rep(F,4))
df[god_2011]
god_2012 <- c(rep(F,17), T, rep(F,3))
df[god_2012]
god_2013 <- c(rep(F,18), T, rep(F,2))
df[god_2013]
god_2014 <- c(rep(F,19), T, rep(F,1))
df[god_2014]
god_2015 <- c(rep(F,20), T)
df[god_2015]

# Заведем список (лист) столбцов, которые отвечают за года
years_n <- list(god_1995, god_1996, god_1997, god_1998, god_1999, god_2000, god_2001, god_2002, god_2003, god_2004, god_2005, god_2006, god_2007, god_2008, god_2009, god_2010, god_2011, god_2012, god_2013, god_2014, god_2015)
years_n

# 2 ЭТАП - Корреляция. Сумма модулей коэфф. корр Спирмена (непараметрич. статистика) по годам

# заводим функцию "sum_mod_koef_korr", которая будет нам считать сумму модулей ВСЕХ (вне зависимости от p-уровня) коэффициентов корреляции Спирмена
sum_mod_koef_korr <- function(x){
  matr_cor <- cor(na.omit(x), method = 'spearman')
  matr_cor <- as.matrix(matr_cor)
  diag(matr_cor) <- NA
  summa_2 <- sum(abs(matr_cor), na.rm = TRUE)
  output <- round(summa_2/2, 2)
  return(output)
}

ves_corr_grafa <- lapply(years_n, function(x) sum_mod_koef_korr(df[x]))
ves_corr_grafa <- unlist(ves_corr_grafa)
length(ves_corr_grafa)

# построим график корреляционного графа по годам
plot(x = 1995:2015, y = ves_corr_grafa, ylab = 'Сумма модулей коэффициентов корреляции Спирмена', xlab = 'Годы')

# проведем z-преобразование всех переменных (стандартизацию по sd)
scaled_df <- as.data.frame(scale(df))
View(scaled_df)
str(scaled_df)

# 3 ЭТАП - СТАНДАРТНОЕ ОТКЛОНЕНИЕ (sd)

# создаем функцию, которая будет считать среднее значение стандартных отклонений - ПРОВЕРИТЬ!!!

my_mean_sd <- function(x){
return(apply(x,2, function(x)sum(abs(x),na.rm = TRUE)))
}
my_mean_sd(scaled_df[god_1995])

# считаем!

my_summ_mean_sd <- lapply(years_n, function(x) my_mean_sd(scaled_df[x]))
my_summ_mean_sd <- lapply(my_summ_mean_sd, mean)
my_summ_mean_sd <- unlist(my_summ_mean_sd)
length(my_summ_mean_sd)

# построим график суммы SD по годам
plot(x = 1995:2015, y = my_summ_mean_sd, ylab = 'SD', xlab = 'Годы')


# 3 ЭТАП - КЛАСТЕРНЫЙ АНАЛИЗ

# Определение оптимального количества кластеров по годам
library(NbClust)

N_95 <- NbClust(scaled_df[god_1995], distance = "euclidean",
             min.nc = 2, max.nc = 15, method = "complete", 
             index = "alllong")
N_95
N_96 <- NbClust(scaled_df[god_1996], distance = "euclidean",
                min.nc = 2, max.nc = 15, method = "complete", 
                index = "alllong")
N_96
N_97 <- NbClust(scaled_df[god_1997], distance = "euclidean",
                min.nc = 2, max.nc = 15, method = "complete", 
                index = "alllong")
N_97
N_98 <- NbClust(scaled_df[god_1998], distance = "euclidean",
                min.nc = 2, max.nc = 15, method = "complete", 
                index = "alllong")
N_99 <- NbClust(scaled_df[god_1999], distance = "euclidean",
                min.nc = 2, max.nc = 15, method = "complete", 
                index = "alllong")
N_00 <- NbClust(scaled_df[god_2000], distance = "euclidean",
                min.nc = 2, max.nc = 15, method = "complete", 
                index = "alllong")
N_00
library(ggplot2)
library(factoextra)

# пример!
#####
theme_set(theme_minimal())
d <- iris[, c("Sepal.Length", "Petal.Width")]
fit <- kmeans(d, 3)
fviz_cluster(fit, d)
#####

# еще один способ
library(cluster)

KM_scaled_1995 <- kmeans(na.omit(scaled_df[god_1995]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_1995]), KM_scaled_1995$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 1995')

KM_scaled_1996 <- kmeans(na.omit(scaled_df[god_1996]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_1996]), KM_scaled_1996$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 1996')

KM_scaled_1997 <- kmeans(na.omit(scaled_df[god_1997]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_1997]), KM_scaled_1997$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 1997')

KM_scaled_1998 <- kmeans(na.omit(scaled_df[god_1998]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_1998]), KM_scaled_1998$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 1998')

KM_scaled_1999 <- kmeans(na.omit(scaled_df[god_1999]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_1999]), KM_scaled_1999$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 1999')

KM_scaled_2000 <- kmeans(na.omit(scaled_df[god_2000]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2000]), KM_scaled_2000$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2000')

KM_scaled_2001 <- kmeans(na.omit(scaled_df[god_2001]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2001]), KM_scaled_2001$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2001')

KM_scaled_2002 <- kmeans(na.omit(scaled_df[god_2002]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2002]), KM_scaled_2002$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2002')

KM_scaled_2003 <- kmeans(na.omit(scaled_df[god_2003]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2003]), KM_scaled_2003$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2003')

KM_scaled_2004 <- kmeans(na.omit(scaled_df[god_2004]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2004]), KM_scaled_2004$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2004')

KM_scaled_2005 <- kmeans(na.omit(scaled_df[god_2005]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2005]), KM_scaled_2005$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2005')

KM_scaled_2006 <- kmeans(na.omit(scaled_df[god_2006]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2006]), KM_scaled_2006$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2006')

KM_scaled_2007 <- kmeans(na.omit(scaled_df[god_2007]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2007]), KM_scaled_2007$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2007')

KM_scaled_2008 <- kmeans(na.omit(scaled_df[god_2008]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2008]), KM_scaled_2008$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2008')

KM_scaled_2009 <- kmeans(na.omit(scaled_df[god_2009]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2009]), KM_scaled_2009$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2009')

KM_scaled_2010 <- kmeans(na.omit(scaled_df[god_2010]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2010]), KM_scaled_2010$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2010')

KM_scaled_2011 <- kmeans(na.omit(scaled_df[god_2011]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2011]), KM_scaled_2011$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2011')

KM_scaled_2012 <- kmeans(na.omit(scaled_df[god_2012]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2012]), KM_scaled_2012$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2012')

KM_scaled_2013 <- kmeans(na.omit(scaled_df[god_2013]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2013]), KM_scaled_2013$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2013')

KM_scaled_2014 <- kmeans(na.omit(scaled_df[god_2014]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2014]), KM_scaled_2014$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2014')

KM_scaled_2015 <- kmeans(na.omit(scaled_df[god_2015]), 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(na.omit(scaled_df[god_2015]), KM_scaled_2015$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for 2015')

summary(KM_scaled_1995)
View(sort(KM_scaled_1995$cluster))
KM_scaled_1995$centers
KM_scaled_1995$totss
KM_scaled_1995$withinss
KM_scaled_1995$tot.withinss
KM_scaled_1995$betweenss
KM_scaled_1995$size
KM_scaled_1995$iter
KM_scaled_1995$ifault

# Скаттерплоты показателей
pairs(df[god_1995])
pairs(df[god_1996])
pairs(df[god_1997])
pairs(df[god_1998])
pairs(df[god_1999])
pairs(df[god_2000])
pairs(df[god_2001])
pairs(df[god_2002])
pairs(df[god_2003])
pairs(df[god_2004])
pairs(df[god_2005])
pairs(df[god_2006])
pairs(df[god_2007])
pairs(df[god_2008])
pairs(df[god_2009])
pairs(df[god_2010])
pairs(df[god_2011])
pairs(df[god_2012])
pairs(df[god_2013])
pairs(df[god_2014])
pairs(df[god_2015])
# БД по годам! - не идет
rbind(df[god_1995], df[god_1996])

# 4 ЭТАП - Анализ главных компонент


# КОНЕЦ "ЧИСТОГО" КОДА :-D









# ЧЕРНОВИК !!!


?kmeans
KM <- kmeans(iris[1:4], 3, iter.max = 1000, algorithm = "Hartigan-Wong")
clusplot(iris[1:4], KM$cluster, color = TRUE, 
         shade = TRUE, labels=2,
         main = 'Cluster Analysis for Iris')
sum_mod_koef_korr <- function(x){
matr_cor <- cor(na.omit(x), method = 'spearman')
matr_cor <- as.matrix(matr_cor)
diag(matr_cor) <- NA
summa_2 <- sum(abs(matr_cor), na.rm = TRUE)
output <- round(summa_2/2, 2)
return(output)
}

list_sd <- apply(scaled_df,2, function(x)sum(abs(x),na.rm = TRUE))

View(list_sd)
list_sd[god_1995]
View(as.data.frame(list_sd))

?cor
god_1995 <- c(T, rep(F,20))
a <- cor(na.omit(df[god_1995]), method = 'spearman')
diag(a) <- NA
b <- apply(a,2, function(x) sum(abs(x), na.rm = TRUE))
sum(b)/2
summary(a)
str(a)
View(a)
god_1996 <- c(rep(F,1), T, rep(F,19))
df[god_1996]
god_1997 <- c(rep(F,2), T, rep(F,18))
df[god_1997]
god_1998 <- c(rep(F,3), T, rep(F,17))
df[god_1998]
god_1999 <- c(rep(F,4), T, rep(F,16))
df[god_1999]
god_2000 <- c(rep(F,5), T, rep(F,15))
df[god_2000]
god_2001 <- c(rep(F,6), T, rep(F,14))
df[god_2001]
god_2002 <- c(rep(F,7), T, rep(F,13))
df[god_2002]
god_2003 <- c(rep(F,8), T, rep(F,12))
df[god_2003]
god_2004 <- c(rep(F,9), T, rep(F,11))
df[god_2004]
god_2005 <- c(rep(F,10), T, rep(F,10))
df[god_2005]
god_2006 <- c(rep(F,11), T, rep(F,9))
df[god_2006]
god_2007 <- c(rep(F,12), T, rep(F,8))
df[god_2007]
god_2008 <- c(rep(F,13), T, rep(F,7))
df[god_2008]
god_2009 <- c(rep(F,14), T, rep(F,6))
df[god_2009]
god_2010 <- c(rep(F,15), T, rep(F,5))
df[god_2010]
god_2011 <- c(rep(F,16), T, rep(F,4))
df[god_2011]
god_2012 <- c(rep(F,17), T, rep(F,3))
df[god_2012]
god_2013 <- c(rep(F,18), T, rep(F,2))
df[god_2013]
god_2014 <- c(rep(F,19), T, rep(F,1))
df[god_2014]
god_2015 <- c(rep(F,20), T)
df[god_2015]

year <- c(rep(rep(F,19),c(1:19)), T, rep(rep(F,19),seq(from = 19, to = 1, by = -1)))

sapply(seq(1:19), function(x) x)

?rep()

rep(1:4, c(2,2,2,2))

p_val_shv_1 <- sapply(df,function(x) shapiro.test(log(x))$p.value)
perem_nenorm_1 <- p_val_shv_1 < 0.05
length(df) - sum(perem_nenorm_1)
shapiro.test(log(df$Mort_1995))
shapiro.test(df$Mort_1995)
hist(log(df$Mort_1995))
hist(df$Mort_1995)
gg <- scale(df)
View(gg)
library(stringr)
a <- lapply(adapt$Регион,function(x) str_replace_all(x, "[:punct:]", ""))
str(a)

a_1 <- lapply(a,function(x) tolower(unlist(str_split(x, "[:space:]"))))
View(a_1)

a_2 <- lapply(a_1, function(x) ifelse(x == 'область', NA, x))
a_3 <- lapply(a_2, function(x) ifelse(x == 'республика', NA, x))
a_3
a_4 <- lapply(a_3, function(x) ifelse(x == 'край', NA, x))
a_4
a_5 <- lapply(a_4, function(x) ifelse(x == 'автономная', NA, x))
a_5
a_6 <- lapply(a_5, function(x) ifelse(x == 'округ', NA, x))
a_7 <- lapply(a_6, function(x) ifelse(x == 'автономный', 'АО', x))
a_7
a_8 <- sapply(a_7, function(x) ifelse(!is.na(x), x, ''))
a_8
frost <- adapt[order(adapt$Норма.t.C.янв), ]
View(frost)
str(adapt)
plot(adapt$X1990)
plot(adapt$X2000)
plot(adapt$X2010)
plot(adapt$X2015)
boxplot(adapt$X1990, adapt$X1995, adapt$X2000, adapt$X2010, adapt$X2015)
hist(adapt$X1990, adapt$X1995, adapt$X2000, adapt$X2010, adapt$X2015)
b <- describe(adapt[ ,3:24])        
?describe
b
b[c(3:5,10)]
hist(adapt$X1990)
hist(adapt$X1995)
hist(adapt$X1998)
hist(adapt$X1999)
hist(adapt$X2000)
hist(adapt$X2001)
hist(adapt$X2002)
hist(adapt$X2003)
hist(adapt$X2004)
hist(adapt$X2005)
hist(adapt$X2010)
hist(adapt$X2015)
shapiro.test(adapt$X1990)
shapiro.test(adapt$X1995)
shapiro.test(adapt$X1996)
shapiro.test(adapt$X1997)
shapiro.test(adapt$X1998)
shapiro.test(adapt$X1999)
shapiro.test(adapt$X2000)
shapiro.test(adapt$X2001)
shapiro.test(adapt$X2002)
shapiro.test(adapt$X2003)
shapiro.test(adapt$X2004)
shapiro.test(adapt$X2005)
shapiro.test(adapt$X2010)
shapiro.test(adapt$X2015)

a <- lapply(adapt[,3:24], F=shapiro.test)
d <- unlist(a)
d$p.value
summary(d)
d
as.data.frame(d)
View(d)
a[[1]]
str(a)
a[[1]][2]
b <- unlist(a,recursive = F)
any(b == "p.value")
any(!complete.cases(adapt))

# JACKNIFE!!!

JN_bias_correction <- function(x, estimator) {
  estimator(x)-(mean(sapply(seq_along(x),function(i) estimator(x[-i])))-estimator(x))*(length(x)-1)
}

sd(adapt$X1990)
skew(adapt$X1990)
JN_bias_correction(adapt$X1990, sd)

a <- readline()
f
g
f
a
print(a)
a <- readline()
5
a
print(as.numeric(a))


gluh_tel <- function(x) {
  x <- readline()
  return(as.numeric(x))
}
gluh_tel()
5
