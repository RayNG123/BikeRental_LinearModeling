# Read in data
bikedata <- read_csv("/Users/raywu/Desktop/day.csv")
bikedata$week <- week(bikedata$dteday)

# Display a random sample of 5 rows, styled and in landscape format
bikedata %>% 
  sample_n(5) %>% 
  kable(digits = 2) %>%
  kable_styling() %>%
  landscape()

# Formatting numerical variables
bikedata$temp <- as.numeric(bikedata$temp)
bikedata$perceived_temp <- as.numeric(bikedata$atemp)
bikedata$atemp <- NULL
bikedata$total_rentals <- as.numeric(bikedata$cnt)
bikedata$cnt <- NULL
bikedata$humidity <- as.numeric(bikedata$humidity)
bikedata$windspeed <- as.numeric(bikedata$windspeed)
bikedata$days <- as.numeric(bikedata$instant)
bikedata$instant <- NULL

# Formatting categorical variables
bikedata$holiday <- as.factor(bikedata$holiday)
bikedata$workingday <- as.factor(bikedata$workingday)
bikedata$weekday <- as.factor(bikedata$weekday)
bikedata$month <- as.factor(bikedata$mnth)
bikedata$mnth <- NULL
bikedata$season <- as.factor(bikedata$season)
bikedata$weather <- as.factor(bikedata$weathersit)
bikedata$weathersit <- NULL

weekday_names <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
# Transform the DayNumber column to weekday names
bikedata$weekday <- factor(bikedata$weekday, levels = 0:6, labels = weekday_names)

season_names <- c("Spring", "Summer", "Autumn", "Winter")
# Transform the season column to season names
bikedata$season <- factor(bikedata$season, levels = 1:4, labels = season_names)

weather_names <- c("Good", "Mild", "Bad")
# Transform the weather column to weather names
bikedata$weather <- factor(bikedata$weather, levels = 1:3, labels = weather_names)
```

```{r }
t_min = -8
t_max = 39
# Transform the normalized temperatures back to real temperatures
bikedata$temp <- bikedata$temp * (t_max - t_min) + t_min

t_min = -16
t_max = 50
# Transform the normalized feels like temperatures back to real temperatures
bikedata$perceived_temp <- bikedata$perceived_temp * (t_max - t_min) + t_min

# Transform the normalized windspeed back to real windspeed
bikedata$windspeed <- bikedata$windspeed * 67

## Transform the normalized humidity back to real humidity
bikedata$humidity <- bikedata$humidity * 100