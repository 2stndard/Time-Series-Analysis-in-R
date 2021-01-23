# Exploring raw time series
# The most common first step when conducting time series analysis is to display your time series dataset in a visually intuitive format. The most useful way to view raw time series data in R is to use the print() command, which displays the Start, End, and Frequency of your data along with the observations.
# 
# Another useful command for viewing time series data in R is the length() function, which tells you the total number of observations in your data.
# 
# Some datasets are very long, and previewing a subset of data is more suitable than displaying the entire series. The head(___, n =___) and tail(___, n =___) functions, in which n is the number of items to display, focus on the first and last few elements of a given dataset respectively.
# 
# In this exercise, you'll explore the famous River Nile annual streamflow data, Nile. This time series dataset includes some metadata information. When calling print(Nile), note that Start = 1871 indicates that 1871 is the year of the first annual observation, and End = 1970 indicates 1970 is the year of the last annual observation.

if(!require(datasets)) {
  install.packages('datasets')
  library(datasets)
}

# Use the print() function to display the River Nile data. The data object is called Nile
# Use the length() function to identify the number of elements in your Nile dataset.
# Use head() to display the first 10 elements of the Nile dataset. To do so, set the n argument equal to 10.
# Use tail() to display the last 12 elements of the Nile dataset, again setting an appropriate value to the n argument.

# Print the Nile dataset
print(Nile)

# List the number of observations in the Nile dataset
length(Nile)

# Display the first 10 elements of the Nile dataset
head(Nile, n = 10)

# Display the last 12 elements of the Nile dataset
tail(Nile, n = 12)

# Basic time series plots
# While simple commands such as print(), length(), head(), and tail() provide crucial information about your time series data, another very useful way to explore any data is to generate a plot.
# 
# In this exercise, you will plot the River Nile annual streamflow data using the plot() function. For time series data objects such as Nile, a Time index for the horizontal axis is typically included. From the previous exercise, you know that this data spans from 1871 to 1970, and horizontal tick marks are labeled as such. The default label of "Time" is not very informative. Since these data are annual measurements, you should use the label "Year". While you're at it, you should change the vertical axis label to "River Volume (1e9 m^{3})".
# 
# Additionally, it helps to have an informative title, which can be set using the argument main. For your purposes, a useful title for this figure would be "Annual River Nile Volume at Aswan, 1871-1970".
# 
# Finally, the default plotting type for time series objects is "l" for line. Connecting consecutive observations can help make a time series plot more interpretable. Sometimes it is also useful to include both the observations points as well as the lines, and we instead use "b" for both.

# Use plot() to display the Nile dataset.
# Use a second call to plot() to display the data, but add the additional arguments: xlab = "Year", ylab = "River Volume (1e9 m^{3})".
# Use a third call to plot() with your Nile data, but this time also add a title and include observation points in the figure by specifying the following arguments: main = "Annual River Nile Volume at Aswan, 1871-1970", type ="b".

# Plot the Nile data
plot(Nile)

# Plot the Nile data with xlab and ylab arguments
plot(Nile, xlab = "Year", ylab = "River Volume(1e9 m^{3})")

# Plot the Nile data with xlab, ylab, main, and type arguments
plot(Nile, xlab = "Year", ylab = "River Volume(1e9 m^{3})", 
     main = 'Annual River Nile Volume at Aswan, 1871-1970', type = 'b')


# What does the time index tell us?
#   Some data are naturally evenly spaced by time. The time series discrete_data shown in the top figure has 20 observations, with one observation appearing at each of the discrete time indices 1 through 20. Discrete time indexing is appropriate for discrete_data.
# 
# The time series continuous_series shown in the bottom figure also has 20 observations, it is following the same periodic pattern as discrete_data, but its observations are not evenly spaced. Its first, second, and last observations were observed at times 1.210322, 1.746137, and 20.180524, respectively. Continuous time indexing is natural for continuous_series, however, the observations are approximately evenly spaced, with about 1 observation observed per time unit. Let's investigate using a discrete time indexing for continuous_series.

# Use plot(___, ___, type = "b") to display continuous_series versus continuous_time_index, its continuous time index
# Create a vector 1:20 to be used as a discrete time index.
# Now use plot(___, ___, type = "b") to display continuous_series versus discrete_time_index
# Note the various differences between the resulting figures, but the approximation appears reasonable because the overall trend remained preserved

# Plot the continuous_series using continuous time indexing
continuous_series <- c( 0.56889468,  0.76630408,  0.99207512,  0.97481741,  0.39912320,  0.37660246,
                        -0.38532033, -0.83635852, -0.99966983, -0.99831019, -0.64622280, -0.09386151,
                        0.40052909,  0.68160578,  0.95318159,  0.99693803,  0.83934194,  0.37003754,
                        -0.25509676, -0.61743983)

continuous_time_index <- c(1.210322,  1.746137,  2.889634,  3.591384,  5.462065,  5.510933,  7.074295,
                           8.264398,  9.373382,  9.541063, 11.161122, 12.378371, 13.390559, 14.066280,
                           15.093547, 15.864515, 16.857413, 18.091457, 19.365451, 20.180524)

par(mfrow=c(2,1))
plot(continuous_time_index,continuous_series, type = "b")

# Make a discrete time index using 1:20 
discrete_time_index <- 1:20

# Now plot the continuous_series using discrete time indexing
plot(discrete_time_index,continuous_series, type = "b")
par(mfrow=c(1,1))


# Identifying the sampling frequency
# In addition to viewing your data and plotting over time, there are several additional operations that can be performed on time series datasets.
# 
# The start() and end() functions return the time index of the first and last observations, respectively. The time() function calculates a vector of time indices, with one element for each time index on which the series was observed.
# 
# The deltat() function returns the fixed time interval between observations and the frequency() function returns the number of observations per unit time. Finally, the cycle() function returns the position in the cycle of each observation.
# 
# In this exercise, you'll practice applying these functions to the AirPassengers dataset, which reports the monthly total international airline passengers (in thousands) from 1949 to 1960.

# Begin by plotting the AirPassengers data using a simple call to plot().
# Next, list the first and last time observations in AirPassengers using start() and end(), respectively.
# Finally, gain some additional insight into this dataset by using the time(), deltat(), frequency(), and cycle() commands AirPassengers.

# Plot AirPassengers
plot(AirPassengers)

# View the start and end dates of AirPassengers
start(AirPassengers)
end(AirPassengers)

# Use time(), deltat(), frequency(), and cycle() with AirPassengers 
time(AirPassengers)
deltat(AirPassengers)
frequency(AirPassengers)
cycle(AirPassengers)


# When is the sampling frequency exact?
#   The sampling frequency is often only approximate and the interval between observations is not quite a fixed unit. For example, there are usually 365 days in a year based on the Gregorian calendar. However, (almost) every four years there are 366 days (leap years). This compensates for the fact that the Earth completes a rotation around Sol, the sun, in approximately 365.2422 days, on average.
# 
# As a simplifying assumption, we often ignore these small discrepancies and proceed as though the sampling frequency and observation intervals are fixed constants. Typically, our results will not be sensitive to approximation when the underlying process is not changing too quickly.
# 
# Which one of the following has an exact sampling frequency?
#   
#   Answer the question
# 50XP
# Possible Answers
# 
# Monthly observations recorded on the last day of the month for several years
# press
# 1
# 
# Weekly observations recorded every Friday for several years
# press
# 2
# 
# Daily observations recorded every "business day" for several weeks
# press
# 3
# 
# Hourly observations recorded each hour for several days
# press
# 4   -> answer

# Exercise
# Missing values
# Sometimes there are missing values in time series data, denoted NA in R, and it is useful to know their locations. It is also important to know how missing values are handled by various R functions. Sometimes we may want to ignore any missingness, but other times we may wish to impute or estimate the missing values.
# 
# Let's again consider the monthly AirPassengers dataset, but now the data for the year 1956 are missing. In this exercise, you'll explore the implications of this missing data and impute some new data to solve the problem.
# 
# The mean() function calculates the sample mean, but it fails in the presence of any NA values. Use mean(___, na.rm = TRUE) to calculate the mean with all missing values removed. It is common to replace missing values with the mean of the observed values. Does this simple data imputation scheme appear adequate when applied the the AirPassengers dataset?
#   
#   Instructions
# 70 XP
# Instructions
# 70 XP
# Use plot() to display a simple plot of AirPassengers. Note the missing data for 1956.
# Use mean() to calculate the sample mean of AirPassengers with the missing data removed (na.rm = TRUE).
# Run the pre-written code to impute the mean values into your missing data.
# Use another call to plot() to replot your newly imputed AirPassengers data.
# Run the pre-written code to add the complete AirPassengers data to your plot.


# Plot the AirPassengers data
plot(AirPassengers)

# Compute the mean of AirPassengers
mean(AirPassengers, na.rm = TRUE)

# Impute mean values to NA in AirPassengers
AirPassengers[85:96] <- mean(AirPassengers, na.rm = TRUE)

# Generate another plot of AirPassengers
plot(AirPassengers)

# Add the complete AirPassengers data to your plot
rm(AirPassengers)
points(AirPassengers, type = "l", col = 2, lty = 3)


# Exercise
# Creating a time series object with ts()
# The function ts() can be applied to create time series objects. A time series object is a vector (univariate) or matrix (multivariate) with additional attributes, including time indices for each observation, the sampling frequency and time increment between observations, and the cycle length for periodic data. Such objects are of the ts class, and represent data that has been observed at (approximately) equally spaced time points. Now you will create time series objects yourself.
# 
# The advantage of creating and working with time series objects of the ts class is that many methods are available for utilizing time series attributes, such as time index information. For example, as you've seen in earlier exercises, calling plot() on a ts object will automatically generate a plot over time.
# 
# In this exercise, you'll familiarize yourself with the ts class by encoding some time series data (saved as data_vector) into ts and exploring the result. Your time series data_vector starts in the year 2004 and has 4 observations per year (i.e. it is quarterly data).
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Apply print() and plot() to data_vector. Note that, by default, your plot does not contain time information.
# Use ts() with data_vector to convert your data to a ts object. Set the start argument equal to 2004 and the frequency argument equal to 4. Assign the result to time_series.
# Use print() and plot() to view your time_series object.

data_vector <- c(2.05219410731111,4.29288527974091,3.32941329441844,3.50859506696045,0.000957693762193124,1.92171863450249,0.797813412800535,0.299954343478063,0.943568753562609,0.574828338758714,-0.00340059028674611,0.34486491757086,2.22297611360904,0.1763144576315,2.70976227698024,1.25019489653419,-0.400716475448651,0.88527321208965,-1.5852420265539,-2.28292788910447,-2.56095312898444,-3.12599637544793,-2.86602958954692,-1.78470092068662,-1.88949129078692,-2.7255351193826,-2.10331418003627,-0.0174256893338487,-0.361320415116881,-2.90084033266105,-3.28474409267047,-2.8684594717709,-1.95050744365674,-4.88018925247303,-3.2634605352894,-1.63960625222554,-3.30125758402894,-2.63312454334943,-1.70583540221139,-2.21198250613255,-0.517059518572955,0.0752508094841423,-0.840699471563585,-1.40226834874561,-0.138211423023857,-1.40659547028281,-2.3046941054804,1.50738914324565,0.711867947688864,-1.13005190223045)

# Use print() and plot() to view data_vector
print(data_vector)
plot(data_vector)

# Convert data_vector to a ts object with start = 2004 and frequency = 4
time_series <- ts(data_vector, start = 2004, frequency = 4)

# Use print() and plot() to view time_series
print(time_series)
plot(time_series)


# Exercise
# Testing whether an object is a time series
# When you work to create your own datasets, you can build them as ts objects. Recall the dataset data_vector from the previous exercise, which was just a vector of numbers, and time_series, the ts object you created from data_vector using the ts() function and information regarding the start time and the observation frequency. As a reminder, data_vector and time_series are shown in the plot on the right.
# 
# When you use datasets from others, such as those included in an R package, you can check whether they are ts objects using the is.ts() command. The result of the test is either TRUE when the data is of the ts class, or FALSE if it is not.
# 
# In this exercise, you'll explore the class of the datasets you've been using throughout this chapter.
# 
# Instructions
# 100 XP
# Use is.ts() on the data_vector and time_series objects from the previous exercise.
# Use another call to is.ts() to check the class of the Nile dataset used in earlier exercises.
# Continue the trend by using is.ts() on the AirPassengers dataset.  


# Check whether data_vector and time_series are ts objects
is.ts(data_vector)
is.ts(time_series)

# Check whether Nile is a ts object
is.ts(Nile)

# Check whether AirPassengers is a ts object
is.ts(AirPassengers)


# Exercise
# Plotting a time series object
# It is often very useful to plot data we are analyzing, as is the case when conducting time series analysis. If the dataset under study is of the ts class, then the plot() function has methods that automatically incorporate time index information into a figure.
# 
# Let's consider the eu_stocks dataset (available in R by default as EuStockMarkets). This dataset contains daily closing prices of major European stock indices from 1991-1998, specifically, from Germany (DAX), Switzerland (SMI), France (CAC), and the UK (FTSE). The data were observed when the markets were open, so there are no observations on weekends and holidays. We will proceed with the approximation that this dataset has evenly spaced observations and is a four dimensional time series.
# 
# To conclude this chapter, this exercise asks you to apply several of the functions you've already learned to this new dataset.
# 
# Instructions
# 100 XP
# Use is.ts() to check whether eu_stocks is a ts object.
# View the start, end, and frequency of eu_stocks using the start(), end(), and frequency() functions, respectively.
# Generate a simple plot of your eu_stocks data using the plot() command.
# Generate a more complex time series plot of your eu_stocks data using the ts.plot() command. Input the eu_stocks dataset into the pre-written code, but leave the other arguments as they are.
# Use the pre-written code to add a legend to your time series plot.

# Check whether eu_stocks is a ts object
eu_stocks <- EuStockMarkets
is.ts(eu_stocks)

# View the start, end, and frequency of eu_stocks
start(eu_stocks)
end(eu_stocks)
frequency(eu_stocks)

# Generate a simple plot of eu_stocks
plot(eu_stocks)

# Use ts.plot with eu_stocks
ts.plot(eu_stocks, col = 1:4, xlab = "Year", ylab = "Index Value", main = "Major European Stock Indices, 1991-1998")

# Add a legend to your ts.plot
legend("topleft", colnames(eu_stocks), lty = 1, col = 1:4, bty = "n")


