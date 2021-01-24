# Exercise
# Simulate the simple moving average model
# The simple moving average (MA) model is a parsimonious time series model used to account for very short-run autocorrelation. It does have a regression like form, but here each observation is regressed on the previous innovation, which is not actually observed. Like the autoregressive (AR) model, the MA model includes the white noise (WN) model as special case.
# 
# As with previous models, the MA model can be simulated using the arima.sim() command by setting the model argument to list(ma = theta), where theta is a slope parameter from the interval (-1, 1). Once again, you also need to specifcy the series length using the n argument.
# 
# In this exercise, you'll simulate and plot three MA models with slope parameters 0.5, 0.9, and -0.5, respectively.
# 
# Instructions
# 100 XP
# Use arima.sim() to simulate a MA model with the slope parameter set to 0.5, and series length 100. Save this model to x.
# Use another call to arima.sim() to simulate a MA model with the slope parameter set to 0.9. Save this model to y.
# Use a third call to arima.sim() to simulate a final MA model with the slope paramter set to -0.5. Save this model to z.
# Use plot.ts() to display all three models.

# Generate MA model with slope 0.5
x <- arima.sim(model = list(ma = 0.5), n = 100)

# Generate MA model with slope 0.9
y <- arima.sim(model = list(ma = 0.9), n = 100)

# Generate MA model with slope -0.5
z <- arima.sim(model = list(ma = -0.5), n = 100)

# Plot all three models together
plot.ts(cbind(x, y, z))


# Exercise
# Estimate the autocorrelation function (ACF) for a moving average
# Now that you've simulated some MA data using the arima.sim() command, you may want to estimate the autocorrelation functions (ACF) for your data. As in the previous chapter, you can use the acf() command to generate plots of the autocorrelation in your MA data.
# 
# In this exercise, you'll use acf() to estimate the ACF for three simulated MA series, x, y, and z. These series have slope parameters of 0.4, 0.9, and -0.75, respectively, and are shown in the figure on the right.
# 
# Instructions
# 100 XP
# Use three calls to acf() to estimate the autocorrelation functions for x, y, and z, respectively.

# Calculate ACF for x
acf(x)

# Calculate ACF for y
acf(y)

# Calculate ACF for z
acf(z)


# Exercise
# Estimate the simple moving average model
# Now that you've simulated some MA models and calculated the ACF from these models, your next step is to fit the simple moving average (MA) model to some data using the arima() command. For a given time series x we can fit the simple moving average (MA) model using arima(..., order = c(0, 0, 1)). Note for reference that an MA model is an ARIMA(0, 0, 1) model.
# 
# In this exercise, you'll practice using a preloaded time series (x, shown in the plot on the right) as well as the Nile dataset used in earlier chapters.
# 
# Instructions
# 100 XP
# Use arima() to fit the MA model to the series x.
# What are the slope (ma1), mean (intercept), and innovation variance (sigma^2) estimates produced by your arima() output? Paste these into your workspace.
# Use a similar call to arima() to fit the MA model to the Nile data. Save the results as MA and use print() to display the output.
# Finally, use the pre-written commands to plot the Nile data and your fitted MA values.

x <- c(-0.291042022894219,0.377630806116457,-0.412682794512086,0.790608561990323,2.62597031625823,1.95541099648636,1.32147721194026,-0.562760166707265,-1.00480197351853,-1.94491931595402,-1.30029115122986,-0.968193030167927,-1.62074777036342,-0.247233802359692,-0.911195824647926,-0.0361466562247089,0.203268062882534,0.323434682027092,1.03223133795942,-0.0660208573530079,1.10417815679315,3.57665936848039,1.92456284690584,0.255062232188208,0.0918814380373624,0.831934350604733,0.577771226651606,-1.1890925787647,-0.927238714854904,-0.288269268499619,0.0917372110788901,-0.248123016048592,-1.73867119817624,0.599437681834219,1.40413384492476,1.94216369439585,2.00154846349997,2.47319615994637,2.00534596339668,-0.546806467636252,-0.0853153466294043,0.05460296973559,1.08002979209658,0.0913566679074134,0.0376785776467646,1.06184834201489,-0.570626634028865,-0.148745795831849,-0.296912403457057,-2.91564127537177,-0.891621363643751,0.0640958092918201,-1.8944101388273,-0.820516527941741,0.296160180333238,1.24526044233284,2.07560936510316,0.81950605376824,-0.445218006292434,-0.618984863721121,-0.308178498213869,-0.779201965665343,-0.619104251893923,0.540893242773311,0.312547530594628,-0.415657237664058,-0.637457047314385,-1.19774636021484,0.381732204600188,0.0109741527838596,-0.550274988857032,0.271509147268856,-1.32344172806042,-1.86513516362868,-1.99571623389816,0.0905303685202479,-1.31823319470043,-1.26874080194791,0.259360700521396,0.986620570397058,1.74593865632634,1.88010691211305,0.434930064817209,-0.986143745400859,0.228894834245518,1.78095940982512,3.71337005088952,2.01759427562472,-0.46069542465496,-1.42215109518776,-0.604121492289651,1.40543361766048,2.35852553801805,1.90795579028563,2.05187460168204,1.57197343045414,-0.754912598598153,-1.39643096284248,-0.522250494025702,-0.298429687058594)
  
# Fit the MA model to x
arima(x, order = c(0,0,1))

# Paste the slope (ma1) estimate below
0.7928

# Paste the slope mean (intercept) estimate below
0.1589

# Paste the innovation variance (sigma^2) estimate below
0.9576

# Fit the MA model to Nile
MA <- arima(Nile, order = c(0,0,1))
print(MA)

# Plot Nile and MA_fit 
ts.plot(Nile)
MA_fit <- Nile - resid(MA)
points(MA_fit, type = "l", col = 2, lty = 2)


# Exercise
# Simple forecasts from an estimated MA model
# Now that you've estimated a MA model with your Nile data, the next step is to do some simple forecasting with your model. As with other types of models, you can use the predict() function to make simple forecasts from your estimated MA model. Recall that the $pred value is the forecast, while the $se value is a standard error for that forecast, each of which is based on the fitted MA model.
# 
# Once again, to make predictions for several periods beyond the last observation you can use the n.ahead = h argument in your call to predict(). The forecasts are made recursively from 1 to h-steps ahead from the end of the observed time series. However, note that except for the 1-step forecast, all forecasts from the MA model are equal to the estimated mean (intercept).
# 
# In this exercise, you'll use the MA model derived from your Nile data to make simple forecasts about future River Nile flow levels. Your MA model from the previous exercise is available in your environment.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Use predict() to make a forecast for River Nile flow level in 1971. Store the forecast in predict_MA.
# Use predict_MA along with $pred[1] to obtain the 1-step forecast.
# Use another call to predict() to make a forecast from 1971 through 1980. To do so, set the n.ahead argument equal to 10.
# Run the pre-written code to plot the Nile time series plus the forecast and 95% prediction intervals.

# Make a 1-step forecast based on MA
predict_MA <- predict(MA, n.ahead = 1)

# Obtain the 1-step forecast using $pred[1]
predict_MA$pred[1]

# Make a 1-step through 10-step forecast based on MA
predict(MA, n.ahead = 10)

# Plot the Nile series plus the forecast and 95% prediction intervals
ts.plot(Nile, xlim = c(1871, 1980))
MA_forecasts <- predict(MA, n.ahead = 10)$pred
MA_forecast_se <- predict(MA, n.ahead = 10)$se
points(MA_forecasts, type = "l", col = 2)
points(MA_forecasts - 2*MA_forecast_se, type = "l", col = 2, lty = 2)
points(MA_forecasts + 2*MA_forecast_se, type = "l", col = 2, lty = 2)


# Exercise
# AR vs MA models
# As you've seen, autoregressive (AR) and simple moving average (MA) are two useful approaches to modeling time series. But how can you determine whether an AR or MA model is more appropriate in practice?
# 
# To determine model fit, you can measure the Akaike information criterion (AIC) and Bayesian information criterion (BIC) for each model. While the math underlying the AIC and BIC is beyond the scope of this course, for your purposes the main idea is these these indicators penalize models with more estimated parameters, to avoid overfitting, and smaller values are preferred. All factors being equal, a model that produces a lower AIC or BIC than another model is considered a better fit.
# 
# To estimate these indicators, you can use the AIC() and BIC() commands, both of which require a single argument to specify the model in question.
# 
# In this exercise, you'll return to the Nile data and the AR and MA models you fitted to this data. These models and their predictions for the 1970s (AR_fit) and (MA_fit) are depicted in the plot on the right.
# 
# Instructions
# 100 XP
# As a first step in comparing these models, use cor() to measure the correlation between AR_fit and MA_fit.
# Use two calls to AIC() to calculate the AIC for AR and MA, respectively.
# Use two calls to BIC() to calculate the BIC for AR and MA, respectively.
rm(AR_model)
rm(MA_model)
AR <- arima(Nile, order = c(1, 0, 0))
MA <- arima(Nile, order = c(0, 0, 1))

AR_fit <- Nile - residuals(AR)
MA_fit <- Nile - residuals(MA)

# Find correlation between AR_fit and MA_fit
cor(AR_fit, MA_fit)

# Find AIC of AR
AIC(AR)

# Find AIC of MA
AIC(MA)

# Find BIC of AR
BIC(AR)

# Find BIC of MA
BIC(MA)

# Excellent work! 
# Series A shows short-run dependence but reverts quickly to the mean, so it must be the MA model. Series B and C are consistent with AR and RW, respectively. 
# Series D does not show any clear patterns, so it must be the WN model.

# Exactly right! 
# Plot A shows autocorrelation for the first lag only, which is consistent with the expectations of the MA model. 
# Plot B shows dissipating autocorrelation across several lags, consistent with the AR model. 
# Plot C is consistent with a RW model with considerable autocorrelation for many lags. 
# Finally. Plot D shows virtually no autocorrelation with any lags, consistent with a WN model. Understanding the logic behind these ACF plots is crucial for understanding how each model operates.