if(!require(datasets)) {
  install.packages('datasets')
  library(datasets)
}

# Exercise
# Asset prices vs. asset returns
# The goal of investing is to make a profit. The revenue or loss from investing depends on the amount invested and changes in prices, and high revenue relative to the size of an investment is of central interest. This is what financial asset returns measure, changes in price as a fraction of the initial price over a given time horizon, for example, one business day.
# 
# Let's again consider the eu_stocks dataset. This dataset reports index values, which we can regard as prices. The indices are not investable assets themselves, but there are many investable financial assets that closely track major market indices, including mutual funds and exchange traded funds.
# 
# Log returns, also called continuously compounded returns, are also commonly used in financial time series analysis. They are the log of gross returns, or equivalently, the changes (or first differences) in the logarithm of prices.
# 
# The change in appearance between daily prices and daily returns is typically substantial, while the difference between daily returns and log returns is usually small. As you'll see later, one advantage of using log returns is that calculating multi-period returns from individual periods is greatly simplified - you just add them together!
#   
#   In this exercise, you'll further explore the eu_stocks dataset, including plotting prices, converting prices to (net) returns, and converting prices to log returns.
# 
# Instructions
# 100 XP
# Use plot() to generate a plot of the eu_stocks data.
# Use the pre-written code to convert daily prices in the eu_stocks data to daily net returns.
# Use ts() to convert returns to a ts object. Set the start argument equal to c(1991, 130) and set the frequency argument equal to 260.
# Use another call to plot() to view daily net returns.
# Use the pre-written code combining diff() and log() to generate logreturns.
# Use a final call to plot() to view daily log returns.

eu_stocks <- EuStockMarkets
# Plot eu_stocks
plot(eu_stocks)

# Use this code to convert prices to returns
returns <- eu_stocks[-1,] / eu_stocks[-1860,] - 1

# Convert returns to ts
returns <- ts(returns, start = c(1991, 130), frequency = 260)

# Plot returns
plot(returns)

# Use this code to convert prices to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)


# Exercise
# Characteristics of financial time series
# Daily financial asset returns typically share many characteristics. Returns over one day are typically small, and their average is close to zero. At the same time, their variances and standard deviations can be relatively large. Over the course of a few years, several very large returns (in magnitude) are typically observed. These relative outliers happen on only a handful of days, but they account for the most substantial movements in asset prices. Because of these extreme returns, the distribution of daily asset returns is not normal, but heavy-tailed, and sometimes skewed. In general, individual stock returns typically have even greater variability and more extreme observations than index returns.
# 
# In this exercise, you'll work with the eu_percentreturns dataset, which is the percentage returns calculated from your eu_stocks data. For each of the four indices contained in your data, you'll calculate the sample mean, variance, and standard deviation.
# 
# Notice that the average daily return is about 0, while the standard deviation is about 1 percentage point. Also apply the hist() and qqnorm() functions to make histograms and normal quantile plots, respectively, for each of the indices.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Use colMeans() to calculate the sample mean for each column in your eu_percentreturns data.
# Use apply() to calculate the sample variance for each index. Leave the MARGIN argument at 2 and set the FUN argument to var.
# Use another call to apply() to calculate the standard deviation for each index. Keep the MARGIN argument at 2 but this time set the FUN argument to sd.
# Use a third call to apply() to display a histogram of percent returns for each index.
# Use a final call to apply() to display normal quantile plots for each index.

eu_percentreturns <- returns * 100

# Generate means from eu_percentreturns
colMeans(eu_percentreturns)

# Use apply to calculate sample variance from eu_percentreturns
apply(eu_percentreturns, MARGIN = 2, FUN = var)

# Use apply to calculate standard deviation from eu_percentreturns
apply(eu_percentreturns, 2, sd)

# Display a histogram of percent returns for each index
par(mfrow = c(2,2))
apply(eu_percentreturns, MARGIN = 2, FUN = hist, main = "", xlab = "Percentage Return")

# Display normal quantile plots of percent returns for each index
par(mfrow = c(2,2))
apply(eu_percentreturns, MARGIN = 2, FUN = qqnorm, main = "")
qqline(eu_percentreturns)


# Exercise
# Plotting pairs of data
# Time series data is often presented in a time series plot. For example, the index values from the eu_stocks dataset are shown in the adjoining figure. Recall, eu_stocks contains daily closing prices from 1991-1998 for the major stock indices in Germany (DAX), Switzerland (SMI), France (CAC), and the UK (FTSE).
# 
# It is also useful to examine the bivariate relationship between pairs of time series. In this exercise we will consider the contemporaneous relationship, that is matching observations that occur at the same time, between pairs of index values as well as their log returns. The plot(a, b) function will produce a scatterplot when two time series names a and b are given as input.
# 
# To simultaneously make scatterplots for all pairs of several assets the pairs() function can be applied to produce a scatterplot matrix. When shared time trends are present in prices or index values it is common to instead compare their returns or log returns.
# 
# In this exercise, you'll practice these skills on the eu_stocks data. Because the DAX and FTSE returns have similar time coverage, you can easily make a scatterplot of these indices. Note that the normal distribution has elliptical contours of equal probability, and pairs of data drawn from the multivariate normal distribution form a roughly elliptically shaped point cloud. Do any of the pairs in the scatterplot matrices exhibit this pattern, before or after log transformation?
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Use plot() to make a scatterplot of DAX and FTSE.
# Use pairs() to make a scatterplot matrix of the four indices in eu_stocks.
# Generate logreturns from eu_stocks using diff(log(___)).
# Use another call to plot() to generate a simple time series plot of logreturns.
# Use another call to pairs() to generate a scatterplot matrix for logreturns.

par(mfrow = c(1,1))
# Make a scatterplot of DAX and FTSE
plot(eu_stocks[,1], eu_stocks[,4])

# Make a scatterplot matrix of eu_stocks
pairs(eu_stocks)

# Convert eu_stocks to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)

# Make a scatterplot matrix of logreturns
pairs(logreturns)


# Exercise
# Calculating sample covariances and correlations
# Sample covariances measure the strength of the linear relationship between matched pairs of variables. The cov() function can be used to calculate covariances for a pair of variables, or a covariance matrix when a matrix containing several variables is given as input. For the latter case, the matrix is symmetric with covariances between variables on the off-diagonal and variances of the variables along the diagonal. On the right you can see the scatterplot matrix of your logreturns data.
# 
# Covariances are very important throughout finance, but they are not scale free and they can be difficult to directly interpret. Correlation is the standardized version of covariance that ranges in value from -1 to 1, where values close to 1 in magnitude indicate a strong linear relationship between pairs of variables. The cor() function can be applied to both pairs of variables as well as a matrix containing several variables, and the output is interpreted analogously.
# 
# In this exercise, you'll use cov() and cor() to explore your logreturns data.
# 
# Instructions
# 100 XP
# Use cov() to calculate the sample covariance between DAX_logreturns and FTSE_logreturns.
# Use another call to cov() to calculate the sample covariance matrix for logreturns.
# Use cor() to calculate the sample correlation between DAX_logreturns and FTSE_logreturns.
# Use another call to cor() to calculate the sample correlation matrix for logreturns.

# Use cov() with DAX_logreturns and FTSE_logreturns
cov(logreturns[, 1], logreturns[, 4])

# Use cov() with logreturns
cov(logreturns)

# Use cor() with DAX_logreturns and FTSE_logreturns
cor(logreturns[, 1], logreturns[, 4])

# Use cor() with logreturns
cor(logreturns)



# Exercise
# Calculating autocorrelations
# Autocorrelations or lagged correlations are used to assess whether a time series is dependent on its past. For a time series x of length n we consider the n-1 pairs of observations one time unit apart. The first such pair is (x[2],x[1]), and the next is (x[3],x[2]). Each such pair is of the form (x[t],x[t-1]) where t is the observation index, which we vary from 2 to n in this case. The lag-1 autocorrelation of x can be estimated as the sample correlation of these (x[t], x[t-1]) pairs.
# 
# In general, we can manually create these pairs of observations. First, create two vectors, x_t0 and x_t1, each with length n-1, such that the rows correspond to (x[t], x[t-1]) pairs. Then apply the cor() function to estimate the lag-1 autocorrelation.
# 
# Luckily, the acf() command provides a shortcut. Applying acf(..., lag.max = 1, plot = FALSE) to a series x automatically calculates the lag-1 autocorrelation.
# 
# Finally, note that the two estimates differ slightly as they use slightly different scalings in their calculation of sample covariance, 1/(n-1) versus 1/n. Although the latter would provide a biased estimate, it is preferred in time series analysis, and the resulting autocorrelation estimates only differ by a factor of (n-1)/n.
# 
# In this exercise, you'll practice both the manual and automatic calculation of a lag-1 autocorrelation. The time series x and its length n (150) have already been loaded. The series is shown in the plot on the right.
# 
# Instructions
# 100 XP
# Create two vectors, x_t0 and x_t1, each with length n-1 such that the rows correspond to the (x[t], x[t-1]) pairs.
# Confirm that x_t0 and x_t1 are (x[t], x[t-1]) pairs using the pre-written code.
# Use plot() to view the scatterplot of x_t0 and x_t1.
# Use cor() to view the correlation between x_t0 and x_t1.
# Use acf() with x to automatically calculate the lag-1 autocorrelation. Set the lag.max argument to 1 to produce a single lag period and set the plot argument to FALSE.
# Confirm that the difference factor is (n-1)/n using the pre-written code.


x <- c(2.06554378999052,1.29963802747643,0.0335779991586895,-0.342580650531909,0.232561264239081,0.46812007757113,4.34111562210087,2.82007636228017,2.90799984071324,2.33495060661069,1.15989953753479,0.820086588740494,-0.243389267211544,-0.0335590712563976,-1.53548215546505,-0.693637973739278,-1.41731647913027,-0.766231785942881,0.835360597257352,0.0439534524450661,1.07447505996982,1.5020036027448,-0.212386088917419,0.329965209904814,-0.750334696700575,-0.105220383198473,0.204719175021121,-0.171705954006398,0.871813778112284,1.47213721162498,0.841125913637882,0.964301566136786,0.668290270984329,-0.257526914755386,0.0819391631343625,-1.46057000075104,-1.26726829570465,-2.19329185949954,-2.21008902344996,0.423389452815624,-1.01513892966255,-1.54446228520407,-0.725240364402779,0.703523784166033,-0.361084556007819,-0.77422092427256,-0.500236026772146,1.31369378401712,1.15621723070589,0.68782374979697,-0.794751834644245,0.325633249568306,2.0095555559387,1.70614292642194,0.999106399555225,0.689327119331469,0.657642591549493,1.51403467336298,0.858064132912175,1.96951272989531,2.98268339457276,3.01781321858016,1.30009670720816,0.711402245361869,0.40782908014827,-0.534298043336185,-0.211472510177074,1.72814428234011,-0.755416648231175,-1.34178776534351,-1.72317007489008,-2.78147841278781,-1.72572506879694,-3.49466070731688,-2.41789448795634,-0.137442480792043,-0.158053099447877,-0.278653567565077,-0.974934997318935,-1.52666608326988,-1.04093145865982,-1.26059747870986,-1.44067011754422,-1.23902633066549,-0.446681739672754,1.12562870363429,3.25518487757103,1.13570548962271,0.989924110291071,0.382442689493209,2.71124649038012,2.42216864579738,1.78509980647879,-1.03092108862379,-1.06607323110348,-2.63465306008288,-2.66808168921168,-1.3041139901592,-1.04269885346643,0.402152604308987,-0.489282505055282,-0.493814702173949,-1.08457733222616,-0.274569450436422,-1.84390880966614,-2.09907628897715,-1.88923578155269,-1.84534262698994,-0.338121587755231,-1.20911695064133,-0.501577007092149,-0.582987341692286,-1.6657587113247,-1.41327839377678,-2.55380295772017,-0.868952900274749,-2.16915011833288,-2.60202618436534,-2.05678158944641,-0.876541096217024,1.32919650125563,1.07620973692969,-0.964326975837399,-1.8148002739182,-2.05757607832246,-2.34353352829789,-0.0146716297323564,0.773214544894368,0.0310621391253578,1.16999559355939,2.677322934875,4.5776173640027,4.90582957736755,4.13300370509818,4.0439809933119,1.350813328708,0.614290430972183,1.42969022855235,0.792311539558566,1.34178061484686,2.22016550780845,2.8250228986348,2.43279283228673,1.89023417675106,0.468774016196125,-1.30680558499926,-1.45910587790943,0.211693298842279,1.10203353866499,1.42360646147849)

n <- length(x)   
# Define x_t0 as x[-1]
x_t0 <- x[-1]

# Define x_t1 as x[-n]
x_t1 <- x[-n]

# Confirm that x_t0 and x_t1 are (x[t], x[t-1]) pairs  
head(cbind(x_t0, x_t1))

# Plot x_t0 and x_t1
plot(x_t0, x_t1)

# View the correlation between x_t0 and x_t1
cor(x_t0, x_t1)

# Use acf with x
acf(x, lag.max = 1, plot = FALSE)

# Confirm that difference factor is (n-1)/n
cor(x_t1, x_t0) * (n-1)/n

# Exercise
# The autocorrelation function
# Autocorrelations can be estimated at many lags to better assess how a time series relates to its past. We are typically most interested in how a series relates to its most recent past.
# 
# The acf(..., lag.max = ..., plot = FALSE) function will estimate all autocorrelations from 0, 1, 2,..., up to the value specified by the argument lag.max. In the previous exercise, you focused on the lag-1 autocorrelation by setting the lag.max argument to 1.
# 
# In this exercise, you'll explore some further applications of the acf() command. Once again, the time series x has been preloaded for you and is shown in the plot on the right.
# 
# Instructions
# 100 XP
# Use acf() to view the autocorrelations of series x from 0 to 10. Set the lag.max argument to 10 and keep the plot argument as FALSE.
# Copy and paste the autocorrelation estimate (ACF) at lag-10.
# Copy and paste the autocorrelation estimate (ACF) at lag-5.


# Generate ACF estimates for x up to lag-10
acf(x, lag.max = 10, plot = FALSE)

# Type the ACF estimate at lag-10 
0.100

# Type the ACF estimate at lag-5
0.198



# Exercise
# Visualizing the autocorrelation function
# Estimating the autocorrelation function (ACF) at many lags allows us to assess how a time series x relates to its past. The numeric estimates are important for detailed calculations, but it is also useful to visualize the ACF as a function of the lag.
# 
# In fact, the acf() command produces a figure by default. It also makes a default choice for lag.max, the maximum number of lags to be displayed.
# 
# Three time series x, y, and z have been loaded into your R environment and are plotted on the right. The time series x shows strong persistence, meaning the current value is closely relatively to those that proceed it. The time series y shows a periodic pattern with a cycle length of approximately four observations, meaning the current value is relatively close to the observation four before it. The time series z does not exhibit any clear pattern.
# 
# In this exercise, you'll plot an estimated autocorrelation function for each time series. In the plots produced by acf(), the lag for each autocorrelation estimate is denoted on the horizontal axis and each autocorrelation estimate is indicated by the height of the vertical bars. Recall that the ACF at lag-0 is always 1.
# 
# Finally, each ACF figure includes a pair of blue, horizontal, dashed lines representing lag-wise 95% confidence intervals centered at zero. These are used for determining the statistical significance of an individual autocorrelation estimate at a given lag versus a null value of zero, i.e., no autocorrelation at that lag.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Use three calls of the function acf() to display the estimated ACFs of each of your three time series (x, y, and z). There is no need to specify additional arguments in your calls to acf().


y <- c(-1.36312060728126,-2.00706364238382,1.45862211011047,5.73596120746645,-0.603823267072017,-1.29457456422529,1.26073028398709,5.43833854623325,-1.1585643164873,-2.09237657208559,1.03041626713827,5.79199689109059,-0.528571966454954,0.499454645163366,0.93698100737819,4.71218782997235,2.55730575465659,1.31872441988474,2.0331954877744,4.46472000734338,1.99539840990304,1.53993613004463,-0.410509994897232,4.89124243149338,0.481710084964648,2.58247253101431,-0.763272073205927,5.17655206722101,0.569275099439513,3.99778743426653,0.47932186064522,3.46193333391523,-0.742411669495783,3.58169586644859,-1.83431881395953,3.30728789668471,0.8936998440844,4.39325953652258,-0.534745172067469,3.21540769529993,0.604957832563929,4.75421555161501,0.363988080602131,2.09948327312111,2.12138476390586,4.17727349262834,1.05270740129118,2.48130175380114,3.87802330053817,4.34323437636758,2.66268151136438,1.7435874352042,6.08305141491008,4.76219086057386,1.74355059673581,2.01715053683958,6.51292830650298,5.3452231625472,0.632672849804765,3.04333010806085,5.87230692497957,4.10617193852513,0.143176271480716,2.81641042970135,5.29614427936887,3.71768120304842,1.70310195860976,2.25183187770822,4.08823195650311,3.57623778617586,1.08373352783885,0.592466189531536,2.83002531967036,3.03413998711584,1.84497378071139,0.254823845187791,3.19478753556958,1.86707192151578,0.608034186464436,2.62445724691458,3.10411046616321,2.17015920468963,-0.0871440329493474,3.05889950222229,3.7510253475956,1.83216352369149,0.93291214122278,4.72282190499923,2.82083761712345,1.33198602593069,0.23962403561427,4.43311810869296,3.37442221975294,0.928001649328708,2.10145008010996,4.94258267974263,3.5172088339717,1.84184772981933,0.582226734174869,4.26214368244291,2.3472334830777,0.122528268933604,0.0347980452334775,5.62552268026737,4.22520183902416,0.694893273003781,0.846116835758326,6.52341813280866,2.92615501899183,0.76643123969863,0.241645596673485,5.07212453418871,2.1560296351907,0.569079727732348,-1.05187562860914,4.85023507878551,1.20440866188839,2.72916194090142,0.828443282688051,1.48136661919986,-1.80317586618949,2.22258833126265,0.816376686286189,1.57200513216224,-1.60120489473834,0.0987160418557094,1.69373402236297,1.61517455463867,-2.15836206849149,0.272363465532929,1.63620428768405,1.47704361825,-2.18305137415202,0.721646825643548,1.85062964462064,0.814396542994926,-1.24802827989708,0.496194773413364,2.98246696623343,1.45211614095396,-1.67283377081972,0.229364769247446,2.82805064000284,2.40730918167961,-0.0459814889022292,1.62622152385003,5.61024672535244,2.94489352347322,-0.77068115111567,0.443787864353255)

y <- ts(y, start = 1, frequency = 1)

z <- c(0.315737981522251,1.73543579439585,-0.00926460076883682,0.813628824812775,-0.928560123821607,-1.153110489415,0.862803689436252,0.531286713837079,-1.16574695322414,-1.81279508882073,1.61236511922821,0.0271975608981466,-0.441448129367708,0.52151574768249,0.669594188361073,0.660542458245858,-0.602768657274635,0.310652090135477,-0.494678886808744,-1.10655973494782,0.570986432145362,-1.00193105376148,0.257165196393851,0.329057029233363,-1.93890112363343,-0.856635089296619,-1.36319880487983,-0.571609990981921,0.805302779006715,-0.496244427380475,0.173629336079876,-0.504015662701373,0.131110158167427,0.420891974546385,-0.229286900482722,-0.5784476343156,-0.469345203467513,0.364004210817155,-0.865851014057776,0.422678124758444,0.463833244063455,-0.792281756443875,-0.764270101782389,-0.550418201509722,0.566427460056139,0.145399530239077,0.482729501731485,0.474884833429626,-0.169909270169774,1.20535106516923,0.775557893647367,-0.0334697933168804,0.117892590519046,0.23360562141542,0.127379647996235,0.949562977986048,0.447922676811352,-0.958977828359765,1.42527455428093,0.501950209626565,-2.39612262003154,0.0466837484118502,-0.167688833070846,0.663482053487827,0.181327339191888,0.220006846899548,-1.99031077870252,1.07923693059039,-0.867702624405994,0.686075604797745,0.48155135079819,-2.11252011704389,1.36793377051952,1.46415602482706,0.0715791352064404,0.302393656649638,-1.10096819600213,0.116053587446827,-0.0425502033574371,0.137278302991764,0.361569682286957,-0.192487806750622,-0.305112478974468,3.12949794801719,-0.378200092195181,0.7167232665475,-0.711138059614713,0.181078208906518,0.688958813958325,0.815627106351754,-0.799253103859885,0.0444623840422131,0.540432742319502,-0.621667265836964,0.544608472272273,-0.365283607732214,-0.759197647787802,-1.49207433226318,-1.17048942589139,-1.56730267092562,-1.61297246409615,1.25471101824145,-0.322366917505429,1.43094826701512,-0.315613777050178,0.16602906884642,0.194490822374866,-0.799452618878954,-1.25150529847144,-2.43042172497236,0.179806634830701,-0.30753934413787,0.504349645150478,-0.442137594235769,-0.363753810022031,-2.18901496849122,0.525841943144546,-0.484855644071415,0.211211542629591,-0.0971351060952729,-0.965549103142152,0.0160068147807103,-0.05998640897858,-0.155469143942357,0.100895283776721,0.0619328485225981,-0.73455877572776,-0.318335104291465,1.03848646229027,1.08541332774707,0.69050164493943,0.859616760287301,0.432452904349441,1.34633355174467,1.92811738880205,0.0147825326528411,0.971231160240161,0.304937611097729,-0.771593549716099,-1.5383969026347,-1.30401535925676,-0.640125562671196,1.13390348309243,0.0297366227732655,0.738796827682997,1.92533977700777,0.988289753245714,1.00978442393311,-0.213503261744429,1.47774163507087)
  
z <- ts(z, start = 1, frequency = 1)


# View the ACF of x
acf(x)

# View the ACF of y
acf(y)

# View the ACF of z
acf(z)
