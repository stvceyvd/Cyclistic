##### Preparing & Cleaning Data #####

## Loading necessary libraries

> library(tidyverse)
── Attaching packages ──────────────────────────────────────── tidyverse 1.3.2 ──
✔ ggplot2 3.3.6     ✔ purrr   0.3.4
✔ tibble  3.1.7     ✔ dplyr   1.0.9
✔ tidyr   1.2.0     ✔ stringr 1.4.0
✔ readr   2.1.2     ✔ forcats 0.5.1
── Conflicts ─────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()

> library(lubridate)
> library(ggplot2)
> library(janitor)

## Importing data (12 months of bikesharing data)

> sept2021 <- read_csv("Downloads/Cyclistic Data /202109-divvy-tripdata.csv") 
Rows: 756147 Columns: 13                                                                                                                       
> oct2021 <- read_csv("Downloads/Cyclistic Data /202110-divvy-tripdata.csv")
Rows: 631226 Columns: 13                                                                                                                       
> nov2021 <- read_csv("Downloads/Cyclistic Data /202111-divvy-tripdata.csv")
Rows: 359978 Columns: 13                                                                                                                       
> dec2021 <- read_csv("Downloads/Cyclistic Data /202112-divvy-tripdata.csv")
Rows: 247540 Columns: 13                                                                                                                       
> jan2022 <- read_csv("Downloads/Cyclistic Data /202201-divvy-tripdata.csv")
Rows: 103770 Columns: 13                                                                                                                       
> feb2022 <- read_csv("Downloads/Cyclistic Data /202202-divvy-tripdata.csv")
Rows: 115609 Columns: 13                                                                                                                       
> mar2022 <- read_csv("Downloads/Cyclistic Data /202203-divvy-tripdata.csv")
Rows: 284042 Columns: 13                                                                                                                       
> april2022 <- read_csv("Downloads/Cyclistic Data /202204-divvy-tripdata.csv")
Rows: 371249 Columns: 13                                                                                                                       
> may2022 <- read_csv("Downloads/Cyclistic Data /202205-divvy-tripdata.csv")
Rows: 634858 Columns: 13                                                                                                                       
> jun2022 <- read_csv("Downloads/Cyclistic Data /202206-divvy-tripdata.csv")
Rows: 769204 Columns: 13                                                                                                                       
> jul2022 <- read_csv("Downloads/Cyclistic Data /202207-divvy-tripdata.csv")
Rows: 823488 Columns: 13                                                                                                                       
> aug2022 <- read_csv("Downloads/Cyclistic Data /202208-divvy-tripdata.csv")
Rows: 785932 Columns: 13                                                                                                                       

## Column specification for all 
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id...
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at

## View Data 
> glimpse(sept2021)
> glimpse(oct2021)
> glimpse(nov2021)
> glimpse(dec2021)
> glimpse(jan2022)
> glimpse(feb2022)
> glimpse(mar2022)
> glimpse(april2022)
> glimpse(may2022)
> glimpse(june2022)
> glimpse(july2022)
> glimpse(august2022)

## Combine data frames
all_trips <- rbind(sept2021, oct2021, nov2021, dec2021, jan2022, feb2022, mar2022, april2022, may2022, jun2022, jul2022, aug2022)

## Inspect new data frame 
> glimpse(all_trips)
Rows: 5,883,043
Columns: 13
$ ride_id            <chr> "9DC7B962304CBFD8", "F930E2C6872D6B32", "6EF72137900BB910", "78D1DE133B3DBF55",…
$ rideable_type      <chr> "electric_bike", "electric_bike", "electric_bike", "electric_bike", "electric_b…
$ started_at         <dttm> 2021-09-28 16:07:10, 2021-09-28 14:24:51, 2021-09-28 00:20:16, 2021-09-28 14:5…
$ ended_at           <dttm> 2021-09-28 16:09:54, 2021-09-28 14:40:05, 2021-09-28 00:23:57, 2021-09-28 15:0…
$ start_station_name <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Clark St & Grace St", NA, NA, NA, NA, …
$ start_station_id   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "TA1307000127", NA, NA, NA, NA, NA, NA,…
$ end_station_name   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
$ end_station_id     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
$ start_lat          <dbl> 41.89000, 41.94000, 41.81000, 41.80000, 41.88000, 41.87000, 41.74000, 41.74000,…
$ start_lng          <dbl> -87.68000, -87.64000, -87.72000, -87.72000, -87.74000, -87.75000, -87.63000, -8…
$ end_lat            <dbl> 41.89, 41.98, 41.80, 41.81, 41.88, 41.88, 41.74, 41.75, 41.95, 41.95, 41.97, 41…
$ end_lng            <dbl> -87.67, -87.67, -87.72, -87.72, -87.71, -87.74, -87.56, -87.63, -87.76, -87.75,…
$ member_casual      <chr> "casual", "casual", "casual", "casual", "casual", "casual", "casual", "casual",…

## Look at dataframe structure 
>str(all_trips)
spec_tbl_df [5,883,043 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:5883043] "9DC7B962304CBFD8" "F930E2C6872D6B32" "6EF72137900BB910" "78D1DE133B3DBF55" ...
 $ rideable_type     : chr [1:5883043] "electric_bike" "electric_bike" "electric_bike" "electric_bike" ...
 $ started_at        : POSIXct[1:5883043], format: "2021-09-28 16:07:10" "2021-09-28 14:24:51" "2021-09-28 00:20:16" ...
 $ ended_at          : POSIXct[1:5883043], format: "2021-09-28 16:09:54" "2021-09-28 14:40:05" "2021-09-28 00:23:57" ...
 $ start_station_name: chr [1:5883043] NA NA NA NA ...
 $ start_station_id  : chr [1:5883043] NA NA NA NA ...
 $ end_station_name  : chr [1:5883043] NA NA NA NA ...
 $ end_station_id    : chr [1:5883043] NA NA NA NA ...
 $ start_lat         : num [1:5883043] 41.9 41.9 41.8 41.8 41.9 ...
 $ start_lng         : num [1:5883043] -87.7 -87.6 -87.7 -87.7 -87.7 ...
 $ end_lat           : num [1:5883043] 41.9 42 41.8 41.8 41.9 ...
 $ end_lng           : num [1:5883043] -87.7 -87.7 -87.7 -87.7 -87.7 ...
 $ member_casual     : chr [1:5883043] "casual" "casual" "casual" "casual" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
 
 ## Check column names
 >colnames(all_trips)
 [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"          
 [5] "start_station_name" "start_station_id"   "end_station_name"   "end_station_id"    
 [9] "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"   

## Check number of rows
> nrow(all_trips)
[1] 5883043

## Look at the first six rows of the df
head(all_trips)
# A tibble: 6 × 13
  ride_id          rideable_type started_at          ended_at            start_station_name start_station_id
  <chr>            <chr>         <dttm>              <dttm>              <chr>              <chr>           
1 9DC7B962304CBFD8 electric_bike 2021-09-28 16:07:10 2021-09-28 16:09:54 NA                 NA              
2 F930E2C6872D6B32 electric_bike 2021-09-28 14:24:51 2021-09-28 14:40:05 NA                 NA              
3 6EF72137900BB910 electric_bike 2021-09-28 00:20:16 2021-09-28 00:23:57 NA                 NA              
4 78D1DE133B3DBF55 electric_bike 2021-09-28 14:51:17 2021-09-28 15:00:06 NA                 NA              
5 E03D4ACDCAEF6E00 electric_bike 2021-09-28 09:53:12 2021-09-28 10:03:44 NA                 NA              
6 346DE323A2677DC0 electric_bike 2021-09-28 01:53:18 2021-09-28 02:00:02 NA                 NA              
# … with 7 more variables: end_station_name <chr>, end_station_id <chr>, start_lat <dbl>, start_lng <dbl>,
#   end_lat <dbl>, end_lng <dbl>, member_casual <chr>

## Look at the last six rows of the df
> tail(all_trips)
# A tibble: 6 × 13
  ride_id          rideable_type started_at          ended_at            start_station_name start_station_id
  <chr>            <chr>         <dttm>              <dttm>              <chr>              <chr>           
1 3A50755D869397FB electric_bike 2022-08-09 06:41:21 2022-08-09 06:45:22 Ashland Ave & Wel… 13269           
2 EC17BE8AB1D73C88 electric_bike 2022-08-12 08:28:26 2022-08-12 08:42:26 Paulina St & Mont… TA1309000021    
3 57BAC0EA3A067A83 electric_bike 2022-08-22 12:30:19 2022-08-22 12:36:32 California Ave & … 13096           
4 9B97FAE30276C299 electric_bike 2022-08-09 07:43:31 2022-08-09 07:50:50 Clinton St & Wash… WL-012          
5 2B4A9BA1E9AA9B51 electric_bike 2022-08-24 14:31:58 2022-08-24 14:40:32 Ashland Ave & Wel… 13269           
6 7F0D048AC7C3B81A electric_bike 2022-08-24 09:45:04 2022-08-24 09:45:19 Clark St & Lincol… 13179           
# … with 7 more variables: end_station_name <chr>, end_station_id <chr>, start_lat <dbl>, start_lng <dbl>,
#   end_lat <dbl>, end_lng <dbl>, member_casual <chr>

## Remove any empty coloums or rows. 
> remove_empty(all_trips, which = c("rows", "cols"), quiet = FALSE)
No empty rows to remove.
No empty columns to remove.

## Create new columns as follows: date, day, month, year, and day of the week
> all_trips$date <- as.Date(all_trips$started_at) 
> all_trips$day <- format(as.Date(all_trips$date), "%d")
> all_trips$month <- format(as.Date(all_trips$date), "%m")
> all_trips$year <- format(as.Date(all_trips$date), "%Y")
> all_trips$weekday <- format(as.Date(all_trips$date), "%A")

## Check for any duplicate rides 
> all_trips[duplicated(all_trips$ride_id), ]
# A tibble: 0 × 18
# … with 18 variables: ride_id <chr>, rideable_type <chr>, started_at <dttm>, ended_at <dttm>,
#   start_station_name <chr>, start_station_id <chr>, end_station_name <chr>, end_station_id <chr>,
#   start_lat <dbl>, start_lng <dbl>, end_lat <dbl>, end_lng <dbl>, member_casual <chr>, date <date>,
#   day <chr>, month <chr>, year <chr>, weekday <chr>

## Created new coloumn for ride length by calculating difference between end and start time
> all_trips$ride_length <-difftime(all_trips$ended_at, all_trips$started_at)

## Check ride_length column and convert time to MM:SS
all_trips$ride_length <- seconds_to_period(all_trips$ride_length)

## Omit NAs
> all_trips <- na.omit(all_trips)

## Check and remove any negative trip lengths 
> all_trips %>% 
+     filter(ended_at < started_at) %>% 
+     count()
# A tibble: 1 × 1
      n
  <int>
1    99

> all_trips <- all_trips  %>% 
+     filter(ended_at > started_at)

## Inspecting data frame after modifications 
> glimpse(all_trips)
Rows: 4,559,855
Columns: 19
$ ride_id            <chr> "E92C804563F261EC", "9ECA91210441E847", "3DAA144C4E85E3AA", "53B99FE9BD0D35F8", "2DB60C25C8C…
$ rideable_type      <chr> "classic_bike", "classic_bike", "classic_bike", "classic_bike", "classic_bike", "electric_bi…
$ started_at         <dttm> 2021-09-05 01:25:08, 2021-09-05 13:33:41, 2021-09-04 23:00:21, 2021-09-14 16:25:16, 2021-09…
$ ended_at           <dttm> 2021-09-05 01:35:46, 2021-09-05 14:06:08, 2021-09-04 23:10:00, 2021-09-14 16:35:03, 2021-09…
$ start_station_name <chr> "Wells St & Walton St", "Larrabee St & Armitage Ave", "Dearborn St & Monroe St", "Kingsbury …
$ start_station_id   <chr> "TA1306000011", "TA1309000006", "TA1305000006", "KA1503000043", "13042", "TA1305000006", "13…
$ end_station_name   <chr> "Desplaines St & Kinzie St", "Clark St & Leland Ave", "Dearborn St & Monroe St", "Orleans St…
$ end_station_id     <chr> "TA1306000003", "TA1309000014", "TA1305000006", "TA1306000006", "13042", "TA1305000006", "13…
$ start_lat          <dbl> 41.89993, 41.91808, 41.88132, 41.88918, 41.90096, 41.88119, 41.90096, 41.88916, 41.88914, 41…
$ start_lng          <dbl> -87.63443, -87.64375, -87.62952, -87.63851, -87.62378, -87.62979, -87.62378, -87.63847, -87.…
$ end_lat            <dbl> 41.88872, 41.96710, 41.88132, 41.90292, 41.90096, 41.88115, 41.90096, 41.88163, 41.88194, 41…
$ end_lng            <dbl> -87.64445, -87.66743, -87.62952, -87.63772, -87.62378, -87.62970, -87.62378, -87.62997, -87.…
$ member_casual      <chr> "casual", "casual", "casual", "casual", "casual", "casual", "casual", "casual", "casual", "c…
$ date               <date> 2021-09-05, 2021-09-05, 2021-09-04, 2021-09-14, 2021-09-13, 2021-09-14, 2021-09-04, 2021-09…
$ day                <chr> "05", "05", "04", "14", "13", "14", "04", "21", "13", "11", "13", "12", "24", "25", "14", "1…
$ month              <chr> "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "0…
$ year               <chr> "2021", "2021", "2021", "2021", "2021", "2021", "2021", "2021", "2021", "2021", "2021", "202…
$ weekday            <chr> "Sunday", "Sunday", "Saturday", "Tuesday", "Monday", "Tuesday", "Saturday", "Tuesday", "Mond…
$ ride_length        <Period> 10M 38S, 32M 27S, 9M 39S, 9M 47S, 4S, 6S, 2H 4M 26S, 6M 56S, 7M 9S, 4M 38S, 29M 17S, 33M …
> 

> str(all_trips)
tibble [4,559,855 × 19] (S3: tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:4559855] "E92C804563F261EC" "9ECA91210441E847" "3DAA144C4E85E3AA" "53B99FE9BD0D35F8" ...
 $ rideable_type     : chr [1:4559855] "classic_bike" "classic_bike" "classic_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:4559855], format: "2021-09-05 01:25:08" "2021-09-05 13:33:41" "2021-09-04 23:00:21" "2021-09-14 16:25:16" ...
 $ ended_at          : POSIXct[1:4559855], format: "2021-09-05 01:35:46" "2021-09-05 14:06:08" "2021-09-04 23:10:00" "2021-09-14 16:35:03" ...
 $ start_station_name: chr [1:4559855] "Wells St & Walton St" "Larrabee St & Armitage Ave" "Dearborn St & Monroe St" "Kingsbury St & Kinzie St" ...
 $ start_station_id  : chr [1:4559855] "TA1306000011" "TA1309000006" "TA1305000006" "KA1503000043" ...
 $ end_station_name  : chr [1:4559855] "Desplaines St & Kinzie St" "Clark St & Leland Ave" "Dearborn St & Monroe St" "Orleans St & Elm St" ...
 $ end_station_id    : chr [1:4559855] "TA1306000003" "TA1309000014" "TA1305000006" "TA1306000006" ...
 $ start_lat         : num [1:4559855] 41.9 41.9 41.9 41.9 41.9 ...
 $ start_lng         : num [1:4559855] -87.6 -87.6 -87.6 -87.6 -87.6 ...
 $ end_lat           : num [1:4559855] 41.9 42 41.9 41.9 41.9 ...
 $ end_lng           : num [1:4559855] -87.6 -87.7 -87.6 -87.6 -87.6 ...
 $ member_casual     : chr [1:4559855] "casual" "casual" "casual" "casual" ...
 $ date              : Date[1:4559855], format: "2021-09-05" "2021-09-05" "2021-09-04" "2021-09-14" ...
 $ day               : chr [1:4559855] "05" "05" "04" "14" ...
 $ month             : chr [1:4559855] "09" "09" "09" "09" ...
 $ year              : chr [1:4559855] "2021" "2021" "2021" "2021" ...
 $ weekday           : chr [1:4559855] "Sunday" "Sunday" "Saturday" "Tuesday" ...
 $ ride_length       :Formal class 'Period' [package "lubridate"] with 6 slots
  .. ..@ .Data : num [1:4559855] 38 27 39 47 4 6 26 56 9 38 ...
  .. ..@ year  : num [1:4559855] 0 0 0 0 0 0 0 0 0 0 ...
  .. ..@ month : num [1:4559855] 0 0 0 0 0 0 0 0 0 0 ...
  .. ..@ day   : num [1:4559855] 0 0 0 0 0 0 0 0 0 0 ...
  .. ..@ hour  : num [1:4559855] 0 0 0 0 0 0 2 0 0 0 ...
  .. ..@ minute: num [1:4559855] 10 32 9 9 0 0 4 6 7 4 ...
 - attr(*, "na.action")= 'omit' Named int [1:1322897] 1 2 3 4 5 6 7 8 9 10 ...
  ..- attr(*, "names")= chr [1:1322897] "1" "2" "3" "4" ...
> 

Saved df as "all_trips_v2"


##### Analyzing Data #####

## Inspecting the dataframe 
Summary(all_trips_v2)
   ride_id          rideable_type        started_at                        ended_at                     
 Length:4559855     Length:4559855     Min.   :2021-09-01 00:00:06.00   Min.   :2021-09-01 00:03:37.00  
 Class :character   Class :character   1st Qu.:2021-11-04 18:44:04.50   1st Qu.:2021-11-04 18:56:16.50  
 Mode  :character   Mode  :character   Median :2022-05-09 21:52:44.00   Median :2022-05-09 22:13:33.00  
                                       Mean   :2022-03-22 14:54:53.43   Mean   :2022-03-22 15:12:53.46  
                                       3rd Qu.:2022-07-06 14:19:27.50   3rd Qu.:2022-07-06 14:36:16.50  
                                       Max.   :2022-08-31 23:58:50.00   Max.   :2022-09-01 19:10:49.00  
 start_station_name start_station_id   end_station_name   end_station_id       start_lat       start_lng     
 Length:4559855     Length:4559855     Length:4559855     Length:4559855     Min.   :41.65   Min.   :-87.83  
 Class :character   Class :character   Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :41.90   Median :-87.64  
                                                                             Mean   :41.90   Mean   :-87.64  
                                                                             3rd Qu.:41.93   3rd Qu.:-87.63  
                                                                             Max.   :45.64   Max.   :-73.80  
    end_lat         end_lng       member_casual           date                day               month          
 Min.   :41.65   Min.   :-87.83   Length:4559855     Min.   :2021-09-01   Length:4559855     Length:4559855    
 1st Qu.:41.88   1st Qu.:-87.66   Class :character   1st Qu.:2021-11-04   Class :character   Class :character  
 Median :41.90   Median :-87.64   Mode  :character   Median :2022-05-09   Mode  :character   Mode  :character  
 Mean   :41.90   Mean   :-87.64                      Mean   :2022-03-22                                        
 3rd Qu.:41.93   3rd Qu.:-87.63                      3rd Qu.:2022-07-06                                        
 Max.   :42.17   Max.   :-87.53                      Max.   :2022-08-31                                        
     year             weekday           ride_length                     
 Length:4559855     Length:4559855     Min.   :1S                       
 Class :character   Class :character   1st Qu.:6M 17S                   
 Mode  :character   Mode  :character   Median :11M 0S                   
                                       Mean   :18M 0.0347907992686487S  
                                       3rd Qu.:19M 45S                  
                                       Max.   :28d 6H 25M 1S  

## Compare statistics between casual and member riders 

> aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
  all_trips_v2$member_casual all_trips_v2$ride_length
1                     casual                 29.40857
2                     member                 29.37906
> aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
  all_trips_v2$member_casual all_trips_v2$ride_length
1                     casual                       41
2                     member                        8
> aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
  all_trips_v2$member_casual all_trips_v2$ride_length
1                     casual                       59
2                     member                       59
> aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)
  all_trips_v2$member_casual all_trips_v2$ride_length
1                     casual                        0
2                     member                        0

## Arranging days of the week 
all_trips_v2$weekday <- ordered(all_trips_v2$weekday, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

## Look at the number of rides and average duration per day of the week by user types (casual and member riders)
> all_trips_v2 %>%
+     group_by(member_casual, weekday) %>% 
+     summarise(number_of_rides = n() 
+               ,average_duration = mean(ride_length)) %>% 
+     arrange(member_casual, weekday)
`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.
# A tibble: 14 × 4
# Groups:   member_casual [2]
   member_casual weekday   number_of_rides average_duration
   <chr>         <ord>               <int>            <dbl>
 1 casual        Sunday             343987             29.4
 2 casual        Monday             221065             29.4
 3 casual        Tuesday            205509             29.3
 4 casual        Wednesday          216892             29.4
 5 casual        Thursday           230975             29.5
 6 casual        Friday             257970             29.4
 7 casual        Saturday           401466             29.4
 8 member        Sunday             313818             29.4
 9 member        Monday             376546             29.4
10 member        Tuesday            426874             29.4
11 member        Wednesday          434692             29.4
12 member        Thursday           412963             29.4
13 member        Friday             365689             29.4
14 member        Saturday           351409             29.4
> 


    





