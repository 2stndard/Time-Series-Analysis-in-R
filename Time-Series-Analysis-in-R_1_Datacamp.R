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





