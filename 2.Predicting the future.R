# Exercise
# Removing trends in variability via the logarithmic transformation
# The logarithmic function log() is a data transformation that can be applied to positively valued time series data. It slightly shrinks observations that are greater than one towards zero, while greatly shrinking very large observations. This property can stabilize variability when a series exhibits increasing variability over time. It may also be used to linearize a rapid growth pattern over time.
# 
# The time series rapid_growth has already been loaded, and is shown in the figure on the right. Note the vertical range of the data.
# 
# Instructions
# 100 XP
# Apply the log() function to rapid_growth, saving the result as linear_growth.
# Use ts.plot() to show the transformed series linear_growth and note the condensed vertical range of the transformed data.
rapid_growth <- c(505.954737316542,447.35560816695,542.583090477044,516.063361274983,506.959924087797,535.016232606015,496.929129437996,497.562555328502,577.248300530956,536.855967325257,541.245940412262,473.497840289097,550.988961460551,569.410637437069,522.915183368473,487.200195130919,594.610786395524,591.173975668723,615.986775394564,621.317545120693,607.125046916761,587.036701378981,554.155438462285,644.117241827027,509.700025728118,607.094339401359,603.55118553444,613.621586650076,544.914334775047,670.811820766561,687.13161588209,615.581708859918,711.187318608945,694.297903386338,681.929344495129,659.140256189321,642.702057830158,601.530062712521,666.762307473106,650.965683100529,606.091343627865,696.678827373702,641.602509472816,855.771919797152,667.329074652784,573.491390192462,791.733265065015,751.591446783947,610.794814080548,624.65033623201,833.298991700858,639.886724484288,736.828256803519,772.292341071224,686.886519321095,667.763083378498,712.94149525726,918.183828402689,656.108907724902,700.497201964217,683.493272462585,781.737968201983,715.684280499056,808.287549436184,820.779546770362,656.885589359776,733.339974340827,773.538730437607,641.202740082118,932.21185739678,680.676565427109,988.282815285029,664.898568280288,813.528318290545,883.408798971726,924.274924691176,969.43211824107,777.329346514109,880.998409919801,971.358289510766,902.958423571348,1020.74565895517,1075.14831710597,886.170748719307,889.632200892515,950.390776999556,878.039522146964,1043.76763270868,901.108966040025,1079.65840856798,933.905398508361,921.9433013918,870.807113616954,811.139766624589,1004.26766243592,1008.17582581146,1189.48933735193,751.970606760973,947.475252330288,886.515305193286,1074.89426408969,1101.1306720708,1130.1854576199,975.849507265787,948.161009999662,1177.8226568287,1227.12713297946,976.995711035094,836.708871866655,1323.60473389093,852.35320730904,1200.82615703738,1274.47884753083,1349.2613900482,1102.63337196778,1324.85659429696,1268.71865481688,1058.22892886463,1204.08723498947,1084.65028499166,1284.43050935569,1195.28425174124,1058.42621256846,1188.0576623439,1166.59336076,1064.69458969538,1429.06852442551,1070.85280871704,1539.33053352377,1467.15710870044,1127.70582024314,1296.0717171226,1555.27412822535,1332.90372372162,1315.4236396165,1189.2461691901,1482.43394167998,1240.92868932515,1237.77196935431,1468.60833835437,1328.54569942606,1589.50783787689,1373.16295850591,1503.55627838567,1659.93756371734,1704.6136574176,1550.46378217986,1625.80261162794,1873.85823632632,1370.62086282574,1439.71135339554,1447.43691659102,1579.91576345679,1681.2571135903,1661.60589978392,1311.84684158442,1326.03084218461,1323.09951189813,1550.48631755657,1606.20420490403,1768.54014627508,1509.8367966576,1592.10861892944,1627.61875806856,1544.63289803997,1439.52343145633,1682.35177380745,1850.70970808186,1673.38009271644,1832.42716167314,1672.26717594592,1781.57683020519,1659.28985001442,1970.03886201406,2044.7123676587,1929.09019953541,1891.7042228956,1487.15774065956,2013.8721752695,1796.78863307401,1977.01825843918,1516.95521151591,1650.6039164404,1523.28339404562,1696.6181065012,1627.26087609279,1787.29683278825,1567.28735420676,1881.99627254267,2318.98327490681,1941.98786180548,1820.27972976969,2154.81229145692,2261.54706560833,2052.22139601365,2079.17104479186,2010.06086639259,2145.26059886687,1775.30080127631,2013.40704947701)
  
ts.plot(rapid_growth)
# Log rapid_growth
linear_growth <-log(rapid_growth)

# Plot linear_growth using ts.plot()
ts.plot(linear_growth)


# Exercise
# Removing trends in level by differencing
# The first difference transformation of a time series  consists of the differences (changes) between successive observations over time, that is .
# 
# Differencing a time series can remove a time trend. The function diff() will calculate the first difference or change series. A difference series lets you examine the increments or changes in a given time series. It always has one fewer observations than the original series.
# 
# The time series z has already been loaded, and is shown in the figure on the right.
# 
# Instructions
# 100 XP
# Apply the diff() function to z, saving the result as dz.
# Use ts.plot() to view a time series plot of the transformed series dz.
# Use two calls of length() to calculate the number of observations in z and dz, respectively.


z <- c(6.22644721334281,6.10335382233382,6.29634123585615,6.24622955111167,6.22843195527522,6.28229708775537,6.20844741922452,6.20972128804789,6.35827250415224,6.28572984126078,6.29387377889552,6.16014735145226,6.31171477530532,6.34460185650482,6.25941927762177,6.18867511691063,6.38790705099065,6.38211034916024,6.42322549478775,6.4318422960411,6.40873477794284,6.37508734151749,6.31744522223519,6.46788076206124,6.23382236782298,6.40868419809582,6.40283085141402,6.41937842976356,6.30062859840956,6.50848865168789,6.53252585448752,6.4225676888201,6.56693585306342,6.54290112400289,6.52492605202954,6.49093634370728,6.46568125422392,6.39947651373773,6.50243362179406,6.47845692668784,6.40703070676956,6.54632451169874,6.46396896781775,6.75200389180284,6.50328328954751,6.35174292371473,6.67422454855503,6.62219288746384,6.41476108293605,6.43719203115034,6.72539251138006,6.46129116769531,6.60235483491626,6.64936315848762,6.53216909563942,6.50393344502688,6.56939936271001,6.82239761937805,6.48632679303797,6.55179037142821,6.52721681333954,6.66151960536819,6.57323912069037,6.69491787322661,6.71025455545394,6.4875098623154,6.5976094065566,6.65097574043069,6.46334569409202,6.83756010365691,6.52308725269382,6.89596890707456,6.49963450012032,6.70138073649028,6.78378805946117,6.82900956493073,6.87671045494522,6.65586412994792,6.78105582107621,6.87869539045853,6.80567650980035,6.9282886773914,6.98021390044576,6.78690965068204,6.79080811988766,6.85687324422581,6.77769160645684,6.95059216963548,6.80362618929694,6.98439998172557,6.83937514670541,6.82648372642902,6.76942049838646,6.69844037789147,6.91201386077297,6.91589786378861,7.081279365728,6.62269723643191,6.85380081770285,6.78729839010667,6.97997757673786,7.00409281457646,7.0301370200274,6.88330838114885,6.85452432960534,7.07142280689253,7.11243105220367,6.88448226209977,6.72947618664758,7.1881141525679,6.74800100349129,7.09076506309115,7.15029262699804,7.20731260322573,7.00545657231082,7.18905950184368,7.14576273692186,6.96435196790078,7.09347707755427,6.98901289603892,7.15807071571375,7.0861393036455,6.96453837871522,7.08007503607121,7.06184312320099,6.970443266778,7.26477812949222,6.97621062749874,7.33910288239914,7.29108186763736,7.02794060038759,7.16709321266713,7.3494070973242,7.19511509230523,7.18191405213385,7.08107491410905,7.30144057114722,7.12361532128538,7.12106824351186,7.29207052275869,7.19184016387511,7.37117971137166,7.22487208663911,7.31558843331146,7.41453526842476,7.44109377015137,7.34630937946721,7.39375688767601,7.5357548122989,7.2230191007094,7.27219792344658,7.27754962755863,7.3651268103319,7.42729707447298,7.41553982321997,7.17919122609255,7.18994543004138,7.18773237814052,7.34632391396533,7.38162903767151,7.47790970913714,7.31975684228401,7.37281459204766,7.39487334104795,7.34254155465234,7.27206738741634,7.42794795886081,7.52332447049693,7.42260086748169,7.51339668490706,7.42193557510494,7.48525411080987,7.41414498862142,7.58580854844815,7.62301240707291,7.56480377155094,7.54523340699751,7.30462202063205,7.60781460317569,7.4937562577587,7.58934505855497,7.32446045453292,7.4088965098932,7.32862341178055,7.4363921995442,7.39465343615595,7.48845960812977,7.35710160410629,7.5400883395603,7.74888412502893,7.5714673984741,7.50674546593622,7.67545889501181,7.72380440037869,7.62667809326483,7.63972455710096,7.605920282382,7.67101631529587,7.48172515305964,7.60758361556912)

# Generate the first difference of z
dz <- diff(z)

# Plot dz
par(mfrow=c(2,1))
ts.plot(z)
ts.plot(dz)
par(mfrow=c(1,1))
# View the length of z and dz, respectively
length(z)
length(dz)


# Exercise
# Removing seasonal trends with seasonal differencing
# For time series exhibiting seasonal trends, seasonal differencing can be applied to remove these periodic patterns. For example, monthly data may exhibit a strong twelve month pattern. In such situations, changes in behavior from year to year may be of more interest than changes from month to month, which may largely follow the overall seasonal pattern.
# 
# The function diff(..., lag = s) will calculate the lag s difference or length s seasonal change series. For monthly or quarterly data, an appropriate value of s would be 12 or 4, respectively. The diff() function has lag = 1 as its default for first differencing. Similar to before, a seasonally differenced series will have s fewer observations than the original series.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# The time series x has already been loaded, and is shown in the adjoining figure ranging below -10 to above +10. Apply the diff(..., lag = 4) function to x, saving the result as dx.
# Use ts.plot() to show the transformed series dx and note the condensed vertical range of the transformed data.
# Use two calls of length() to calculate the number of observations in x and dx, respectively.

x <- c(-4.19803335973822,9.56900905050747,5.17514338906622,-9.69164636184119,-3.21529357476552,10.8436693062559,6.45215865708188,-10.8335590731441,-2.23535073514566,10.119832962947,6.57964573528545,-8.65656473226148,-2.51500138847406,9.83743416797243,7.38619432726046,-8.24350355631342,-4.26403257072438,8.89886143008727,8.54433581556254,-8.06691284107053,-4.02302530566536,9.82267856454484,7.77285238609707,-6.58777686807675,-3.45917112006633,10.6138505016733,7.37445047382904,-5.79871450522201,-1.20471055826558,11.4292358845515,7.57004694873634,-4.96838375977415,-2.00378659668805,11.9413482982078,9.40667210265289,-4.39658482425492,-1.55557889273259,12.5998771289623,8.50291637845889,-3.72896826710606,-2.82700000921691,13.3759812867942,8.12894114749321,-3.14924907770406,-2.79947272334396,13.7105701226795,6.75521688156725,-3.77974417787649,-3.76827394084617,13.6253358560593,6.53793056349892,-3.24909834265677,-5.02419102826334,13.3553731337997,6.93116080641335,-3.52735350362993,-5.19732896878058,11.5797913233393,7.16244857247412,-1.89460681643879,-5.77779700690048,12.4826952884178,6.20808841277938,-3.43403797043816,-7.08072100968159,11.4136557746633,6.74199013667799,-3.53237586423137,-8.39354230059932,12.5072611286297,6.47317547164243,-3.74524618197473,-9.42620870823793,12.3808170457897,8.04824272204917,-2.83152774381656,-7.30189285880787,12.7658383061004,8.22369850629786,-4.44813067987144,-6.96355759602497,12.0340049862918,7.57492470964176,-5.40221818593254,-6.56819814480662,10.8964815061608,7.27657057973042,-4.03787337902209,-6.72301328397502,12.1808149692035,8.28516213832065,-4.15934247966369,-6.36067044646075,12.7530177649457,8.66591165178255,-5.44053784032607,-4.87493170537183,12.6001974041011,8.16258920594197,-6.53957167229621)

# Generate a diff of x with lag = 4. Save this to dx
dx <- diff(x, lag = 4)

# Plot dx
par(mfrow=c(2,1))
ts.plot(x)
ts.plot(dx)  
par(mfrow=c(1,1))

# View the length of x and dx, respectively 
length(x)
length(dx)
  


# Exercise
# Simulate the white noise model
# The white noise (WN) model is a basic time series model. It is also a basis for the more elaborate models we will consider. We will focus on the simplest form of WN, independent and identically distributed data.
# 
# The arima.sim() function can be used to simulate data from a variety of time series models. ARIMA is an abbreviation for the autoregressive integrated moving average class of models we will consider throughout this course.
# 
# An ARIMA(p, d, q) model has three parts, the autoregressive order p, the order of integration (or differencing) d, and the moving average order q. We will detail each of these parts soon, but for now we note that the ARIMA(0, 0, 0) model, i.e., with all of these components zero, is simply the WN model.
# 
# In this exercise, you will practice simulating a basic WN model.
# 
# Instructions
# 100 XP
# Use arima.sim() to simulate from the WN model with list(order = c(0, 0, 0)). Set the n argument equal to 100 to produce 100 observations. Save this data as white_noise.
# Plot your white_noise object using ts.plot().
# Replicate your original call to arima.sim() but this time set the mean argument to 100 and the sd argument to 10. Save this data as white_noise_2.
# Plot your white_noise_2 object with another call to ts.plot().


# Simulate a WN model with list(order = c(0, 0, 0))
white_noise <- arima.sim(model = list(order = c(0,0,0)), n = 100)

# Plot your white_noise data
ts.plot(white_noise)

# Simulate from the WN model with: mean = 100, sd = 10
white_noise_2 <- arima.sim(model = list(order = c(0,0,0)), n = 100, mean = 100, sd = 10)

# Plot your white_noise_2 data
ts.plot(white_noise_2)


# Exercise
# Estimate the white noise model
# For a given time series y we can fit the white noise (WN) model using the arima(..., order = c(0, 0, 0)) function. Recall that the WN model is an ARIMA(0,0,0) model. Applying the arima() function returns information or output about the estimated model. For the WN model this includes the estimated mean, labeled intercept, and the estimated variance, labeled sigma^2.
# 
# In this exercise, you'll explore the qualities of the WN model. What is the estimated mean? Compare this with the sample mean using the mean() function. What is the estimated variance? Compare this with the sample variance using the var() function.
# 
# The time series y has already been loaded, and is shown in the adjoining figure.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Use arima() to estimate the WN model for y. Be sure to include the order = c(0, 0, 0) argument after specifying your data.
# Calculate the mean and variance of y using mean() and var(), respectively. Compare the results with the output of your arima() command.

y <- c(109.761335203807,98.3161015661823,100.63294691568,88.7433987127593,101.872377016961,104.628357308022,96.6446185677499,102.861935537741,112.762472095071,82.2321895604405,88.9443425162465,94.603184959066,105.611134283638,113.827759889612,104.823186799211,101.296287605209,82.9845883499902,88.9605839815819,100.600456607996,91.035249256563,100.1928594042,95.3253727241077,94.5864315510523,121.358295918349,87.3787382991481,96.8900652561591,90.5130974518601,99.9084292221271,102.569341770317,104.961440623652,104.734635474905,88.0046450549299,100.779432761891,121.647764133843,85.7708319146464,79.1542817751461,98.1884698770029,99.9000575918412,98.9108408854003,101.644224781541,102.795262786231,84.6511153287627,96.478695879623,105.815471102771,98.5186873070791,105.24366218935,109.612642086809,85.1420130618153,82.8144174251857,103.036291436483,93.5696735465724,98.0892223944794,81.2546061795588,109.185538293753,80.4318090604482,103.559532399435,80.2226855501286,84.9747654707037,107.783629803383,92.612875815647,99.8029344059519,107.250849637866,98.6637847611836,91.9227453154993,98.3264180218282,112.734017659718,96.0281067924588,92.6490908853105,83.0848439102975,97.2219648542801,106.613612756687,97.3694287042478,108.784654442207,104.918584253723,84.4434297475219,85.6078609998276,96.5152905606852,94.1810528014953,85.0285128829162,63.2662175136146,87.2213673144322,103.522954295167,105.602155542432,103.260391527392,101.115192549417,108.456965675889,97.676314341323,103.010808274931,100.617555510141,105.581077298303,98.7272241180465,98.4399563595089,90.7821910344929,92.7459923258825,102.937624393826,83.9530591640689,110.159366234931,104.175781699309,99.2787550528578,103.251148823917)

y <- ts(y, start = 1, end = 100, frequency = 1)

# Fit the WN model to y using the arima command
arima(y, order = c(0,0,0))

# Calculate the sample mean and sample variance of y
mean(y)
var(y)

# Exercise
# Simulate the random walk model
# The random walk (RW) model is also a basic time series model. It is the cumulative sum (or integration) of a mean zero white noise (WN) series, such that the first difference series of a RW is a WN series. Note for reference that the RW model is an ARIMA(0, 1, 0) model, in which the middle entry of 1 indicates that the model's order of integration is 1.
# 
# The arima.sim() function can be used to simulate data from the RW by including the model = list(order = c(0, 1, 0)) argument. We also need to specify a series length n. Finally, you can specify a sd for the series (increments), where the default value is 1.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Use arima.sim() to generate a RW model. Set the model argument equal to list(order = c(0, 1, 0)) to generate a RW-type model and set n equal to 100 to produce 100 observations. Save this to random_walk.
# Use ts.plot() to plot your random_walk data.
# Use diff() to calculate the first difference of your random_walk data. Save this as random_walk_diff.
# Use another call to ts.plot() to plot random_walk_diff.

# Generate a RW model using arima.sim
random_walk <- arima.sim(model = list(order = c(0, 1, 0)), n = 100)

# Plot random_walk
ts.plot(random_walk)

# Calculate the first difference series
random_walk_diff <- diff(random_walk)

# Plot random_walk_diff
ts.plot(random_walk_diff)


# Exercise
# Simulate the random walk model with a drift
# A random walk (RW) need not wander about zero, it can have an upward or downward trajectory, i.e., a drift or time trend. This is done by including an intercept in the RW model, which corresponds to the slope of the RW time trend.
# 
# For an alternative formulation, you can take the cumulative sum of a constant mean white noise (WN) series, such that the mean corresponds to the slope of the RW time trend.
# 
# To simulate data from the RW model with a drift you again use the arima.sim() function with the model = list(order = c(0, 1, 0)) argument. This time, you should add the additional argument mean = ... to specify the drift variable, or the intercept.
# 
# Instructions
# 100 XP
# Use arima.sim() to generate another RW model. Set the model argument equal to list(order = c(0, 1, 0)) to generate a RW-type model and set n equal to 100 to produce 100 observations. Set the mean argument to 1 to produce a drift. Save this to rw_drift.
# Use ts.plot() to plot your rw_drift data.
# Use diff() to calculate the first difference of your rw_drift data. Save this as rw_drift_diff.
# Use another call to ts.plot() to plot rw_drift_diff.


# Generate a RW model with a drift uing arima.sim
rw_drift <- arima.sim(model = list(order = c(0,1,0)), n = 100, mean = 1)

# Plot rw_drift
ts.plot(rw_drift)

# Calculate the first difference series
rw_drift_diff <- diff(rw_drift)

# Plot rw_drift_diff
ts.plot(rw_drift_diff)
mean(rw_drift_diff)


# Exercise
# Estimate the random walk model
# For a given time series y we can fit the random walk model with a drift by first differencing the data, then fitting the white noise (WN) model to the differenced data using the arima() command with the order = c(0, 0, 0)) argument.
# 
# The arima() command displays information or output about the fitted model. Under the Coefficients: heading is the estimated drift variable, named the intercept. Its approximate standard error (or s.e.) is provided directly below it. The variance of the WN part of the model is also estimated under the label sigma^2.
# 
# Instructions
# 70 XP
# Instructions
# 70 XP
# The time series random_walk has already been loaded, and is shown in the adjoining figure. Use diff() to generate the first difference of the data. Save this to rw_diff.
# Use ts.plot() to plot your differenced data
# Use arima() to fit the WN model for the differenced data. To do so, set the x argument to rw_diff and set the order argument to c(0, 0, 0). Store the model in model_wn.
# Store the intercept value of model_wn in int_wn. You can obtain this value using model_wn$coef.
# Use ts.plot() to reproduce your original plot of random_walk.
# Add the estimated time trend to the adjoining plot with the function abline(). You can use int_wn as the second argument.

random_walk <- c(0,0.840799690805892,0.637459389341622,0.757921658699468,0.51187422142312,0.113766891514572,0.278972783338605,0.277594629974007,0.603058933300874,2.91209633642732,3.18199136208394,2.55157314365465,3.26756203062092,4.99979931564387,7.10915802250204,8.01070864926096,8.23772461506037,8.70157227268806,9.05126103820082,13.3200713895243,12.167575412894,11.5324303105757,12.2601004793325,12.5767819422196,12.6632633175434,12.7256680349732,13.1994836806694,12.8396495033226,13.5061940806857,15.4816848106994,16.177107725103,16.8365295156745,16.6163362311588,16.1808336886557,16.9662659934889,16.7270308469477,17.6561798270108,20.8901636724502,20.0567603436916,22.4168556898516,23.1628256130545,22.9168361903724,21.9326982045095,22.65474670326,23.6325743016245,24.8637728096747,25.5358779389007,27.2225699268809,27.3721605280673,29.0197579376152,30.86984194858,32.4859913444825,33.1883373188887,33.7998279266371,32.7718376006665,33.3293449130956,36.0168049817462,36.4458500836042,38.2388466589622,39.1157216648363,38.7992108420878,39.2275167845668,37.5690113188738,40.0882062820111,40.5380768982454,40.757863652738,41.5757014101746,41.1067983652453,41.1064560275605,40.645532029424,39.5554850868954,40.4312197530977,41.9604182429803,43.6866496098288,45.2350442037095,45.9024581686138,47.540457130699,49.0971826208823,48.9170239101692,48.0796342742815,46.7765324003763,47.9775098038997,46.4334192966129,45.9453639155814,47.0727461261722,47.1890042341391,51.2925270988872,52.1247376806133,51.3796798321698,52.127045835946,51.2230171217941,52.6301981357515,52.4262448587789,51.3564738575462,52.2017865810857,53.3817249795485,55.0244437963563,55.9303590282021,55.5117187960721,58.308031867784,58.1183345226755)
  
random_walk <- ts(random_walk, start = 1, end = 100, frequency = 1)

# Difference your random_walk data
rw_diff <- diff(random_walk)

# Plot rw_diff
ts.plot(rw_diff)

# Now fit the WN model to the differenced data
model_wn <- arima(rw_diff, order = c(0,0,0))

# Store the value of the estimated time trend (intercept)
int_wn <- model_wn$coef

# Plot the original random_walk data
ts.plot(random_walk)

# Use abline(0, ...) to add time trend to the figure
abline(0, int_wn)

# Exercise
# Are the white noise model or the random walk model stationary?
#   The white noise (WN) and random walk (RW) models are very closely related. However, only the RW is always non-stationary, both with and without a drift term. This is a simulation exercise to highlight the differences.
# 
# Recall that if we start with a mean zero WN process and compute its running or cumulative sum, the result is a RW process. The cumsum() function will make this transformation for you. Similarly, if we create a WN process, but change its mean from zero, and then compute its cumulative sum, the result is a RW process with a drift.
# 
# Instructions
# 100 XP
# Use arima.sim() to generate a WN model. Set the model argument equal to list(order = c(0, 0, 0)) to generate a WN-type model and set n equal to 100 to produce 100 observations. Save this to white_noise.
# Use the cumsum() function on white_noise to quickly convert your WN model to RW data. Save this to random_walk.
# Use a similar call toarima.sim() to generate a second WN model. Keep all arguments the same, but this time set the mean argument to 0.4. Save this to wn_drift.
# Use another call to cumsum() to convert your wn_drift data to RW. Save this as rw_drift.
# Enter the pre-written code to plot all four series for comparison.


# Use arima.sim() to generate WN data
white_noise <- arima.sim(model = list(order = c(0,0,0)), n = 100)

# Use cumsum() to convert your WN data to RW
random_walk <- cumsum(white_noise)

# Use arima.sim() to generate WN drift data
wn_drift <- arima.sim(model = list(order = c(0, 0, 0)), mean = 0.4, n = 100)

# Use cumsum() to convert your WN drift data to RW
rw_drift <- cumsum(wn_drift)

# Plot all four data objects
plot.ts(cbind(white_noise, random_walk, wn_drift, rw_drift))


