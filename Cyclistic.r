##### Preparing the Data #####

## Loading necessary packages/libraries

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

##### Cleaning the Data #####

## Remove any empty coloums or rows. 
> remove_empty(all_trips, which = c("rows", "cols"), quiet = FALSE)
No empty rows to remove.
No empty columns to remove.

## Check for any duplicate rides 
> all_trips[duplicated(all_trips$ride_id), ]

## Omit NAs, remove rows with negative trip duration, remove rows with too long of a duration (> 1 day or 1440 minutes)
> all_trips <- na.omit(all_trips)
> all_trips <- all_trips[!all_trips$ride_length < 1,]
> all_trips <- all_trips[!all_trips$ride_length > 1440,]

## Create new columns as follows: date, day, month, year, and day of the week
> all_trips$date <- as.Date(all_trips$started_at) 
> all_trips$day <- format(as.Date(all_trips$date), "%d")
> all_trips$month <- format(as.Date(all_trips$date), "%m")
> all_trips$year <- format(as.Date(all_trips$date), "%Y")
> all_trips$weekday <- format(as.Date(all_trips$date), "%A")

## Created new coloumn for ride length by calculating difference between end and start time
> all_trips$ride_length <- (as.double(difftime(all_trips$ended_at, all_trips$started_at))) /60

## Rename user type column for clarification
all_trips <- rename(all_trips, user_type = member_casual)

## Inspecting data frame after modifications 
> glimpse(all_trips)
Rows: 4,487,941
Columns: 20
$ ride_id            <chr> "E92C804563F261EC", "9ECA91210441E847", "3DAA144C4E85E3AA", "53B99FE9B…
$ rideable_type      <chr> "classic_bike", "classic_bike", "classic_bike", "classic_bike", "class…
$ started_at         <dttm> 2021-09-05 01:25:08, 2021-09-05 13:33:41, 2021-09-04 23:00:21, 2021-0…
$ ended_at           <dttm> 2021-09-05 01:35:46, 2021-09-05 14:06:08, 2021-09-04 23:10:00, 2021-0…
$ start_station_name <chr> "Wells St & Walton St", "Larrabee St & Armitage Ave", "Dearborn St & M…
$ start_station_id   <chr> "TA1306000011", "TA1309000006", "TA1305000006", "KA1503000043", "13042…
$ end_station_name   <chr> "Desplaines St & Kinzie St", "Clark St & Leland Ave", "Dearborn St & M…
$ end_station_id     <chr> "TA1306000003", "TA1309000014", "TA1305000006", "TA1306000006", "13042…
$ start_lat          <dbl> 41.89993, 41.91808, 41.88132, 41.88918, 41.90096, 41.88916, 41.88914, …
$ start_lng          <dbl> -87.63443, -87.64375, -87.62952, -87.63851, -87.62378, -87.63847, -87.…
$ end_lat            <dbl> 41.88872, 41.96710, 41.88132, 41.90292, 41.90096, 41.88163, 41.88194, …
$ end_lng            <dbl> -87.64445, -87.66743, -87.62952, -87.63772, -87.62378, -87.62997, -87.…
$ user_type          <chr> "casual", "casual", "casual", "casual", "casual", "casual", "casual", …
$ date               <date> 2021-09-05, 2021-09-05, 2021-09-04, 2021-09-14, 2021-09-04, 2021-09-2…
$ day                <chr> "05", "05", "04", "14", "04", "21", "13", "11", "13", "12", "24", "25"…
$ month              <chr> "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "09", "09"…
$ year               <chr> "2021", "2021", "2021", "2021", "2021", "2021", "2021", "2021", "2021"…
$ weekday            <chr> "Sunday", "Sunday", "Saturday", "Tuesday", "Saturday", "Tuesday", "Mon…
$ time               <chr> "01:25", "13:33", "23:00", "16:25", "13:59", "07:36", "07:28", "01:13"…
$ ride_length        <dbl> 10.633333, 32.450000, 9.650000, 9.783333, 124.433333, 6.933333, 7.1500…

## Looking at structure of data frame
> str(all_trips)
tibble [4,487,941 × 20] (S3: tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:4487941] "E92C804563F261EC" "9ECA91210441E847" "3DAA144C4E85E3AA" "53B99FE9BD0D35F8" ...
 $ rideable_type     : chr [1:4487941] "classic_bike" "classic_bike" "classic_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:4487941], format: "2021-09-05 01:25:08" "2021-09-05 13:33:41" "2021-09-04 23:00:21" ...
 $ ended_at          : POSIXct[1:4487941], format: "2021-09-05 01:35:46" "2021-09-05 14:06:08" "2021-09-04 23:10:00" ...
 $ start_station_name: chr [1:4487941] "Wells St & Walton St" "Larrabee St & Armitage Ave" "Dearborn St & Monroe St" "Kingsbury St & Kinzie St" ...
 $ start_station_id  : chr [1:4487941] "TA1306000011" "TA1309000006" "TA1305000006" "KA1503000043" ...
 $ end_station_name  : chr [1:4487941] "Desplaines St & Kinzie St" "Clark St & Leland Ave" "Dearborn St & Monroe St" "Orleans St & Elm St" ...
 $ end_station_id    : chr [1:4487941] "TA1306000003" "TA1309000014" "TA1305000006" "TA1306000006" ...
 $ start_lat         : num [1:4487941] 41.9 41.9 41.9 41.9 41.9 ...
 $ start_lng         : num [1:4487941] -87.6 -87.6 -87.6 -87.6 -87.6 ...
 $ end_lat           : num [1:4487941] 41.9 42 41.9 41.9 41.9 ...
 $ end_lng           : num [1:4487941] -87.6 -87.7 -87.6 -87.6 -87.6 ...
 $ user_type         : chr [1:4487941] "casual" "casual" "casual" "casual" ...
 $ date              : Date[1:4487941], format: "2021-09-05" "2021-09-05" "2021-09-04" ...
 $ day               : chr [1:4487941] "05" "05" "04" "14" ...
 $ month             : chr [1:4487941] "09" "09" "09" "09" ...
 $ year              : chr [1:4487941] "2021" "2021" "2021" "2021" ...
 $ weekday           : chr [1:4487941] "Sunday" "Sunday" "Saturday" "Tuesday" ...
 $ time              : chr [1:4487941] "01:25" "13:33" "23:00" "16:25" ...
 $ ride_length       : num [1:4487941] 10.63 32.45 9.65 9.78 124.43 ...
 - attr(*, "na.action")= 'omit' Named int [1:1322897] 1 2 3 4 5 6 7 8 9 10 ...
  ..- attr(*, "names")= chr [1:1322897] "1" "2" "3" "4" ...


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

## Stats of ride duration length 
> summary(all_trips$ride_length)  
 Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
   1.000    6.483   11.183   17.880   19.967 1439.367 

## Looking at summary stats of casual and member users 
> aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = mean)
  all_trips$user_type all_trips$ride_length
1              casual              25.17643
2              member              12.75094

> aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = median)
  all_trips$user_type all_trips$ride_length
1              casual             14.883333
2              member              9.283333

> aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = max)
  all_trips$user_type all_trips$ride_length
1              casual              1439.367
2              member              1435.467

> aggregate(all_trips$ride_length ~ all_trips$user_type, FUN = min)
  all_trips$user_type all_trips$ride_length
1              casual                     1
2              member                     1

## Number of user types
table(all_trips$user_type)

 casual  member 
1852509 2635432 

## Comparing stats between casual and member users
> all_trips %>% 
+     group_by(user_type) %>% 
+     summarise(min_length = min(ride_length), max_length = max(ride_length), 
+               median_length = median(ride_length), mean_length = mean(ride_length))
# A tibble: 2 × 5
  user_type min_length max_length median_length mean_length
  <chr>          <dbl>      <dbl>         <dbl>       <dbl>
1 casual             1      1439.         14.9         25.2
2 member             1      1435.          9.28        12.8

## Arranging days of the week 
all_trips$weekday <- ordered(all_trips$weekday, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

## Number of rides and average duration per day of the week by user types (casual and member riders)
> all_trips
+     group_by(user_type, weekday) %>% 
+     summarise(total_rides = n(), avg_ride = mean(ride_length)) %>% 
+     arrange(weekday)
`summarise()` has grouped output by 'user_type'. You can override using the `.groups` argument.

# A tibble: 14 × 4
# Groups:   user_type [2]
   user_type weekday   total_rides avg_ride
   <chr>     <ord>           <int>    <dbl>
 1 casual    Sunday         339248     28.9
 2 member    Sunday         307901     14.4
 3 casual    Monday         217992     26.0
 4 member    Monday         370276     12.3
 5 casual    Tuesday        202756     22.3
 6 member    Tuesday        419687     12.0
 7 casual    Wednesday      213991     21.6
 8 member    Wednesday      427379     12.1
 9 casual    Thursday       227929     22.2
10 member    Thursday       406034     12.2
11 casual    Friday         254587     23.5
12 member    Friday         359258     12.5
13 casual    Saturday       396006     27.8
14 member    Saturday       344897     14.3

## Number of rides and average trip duration per day in desc order
all_trips %>%
+ group_by(weekday) %>%
+ summarise(total_rides = n(), avg_ride = mean(ride_length)) %>%
+ arrange(desc(total_rides))
# A tibble: 7 × 3
  weekday   total_rides avg_ride
  <ord>           <int>    <dbl>
1 Saturday       740903     21.5
2 Sunday         647149     22.0
3 Wednesday      641370     15.3
4 Thursday       633963     15.8
5 Tuesday        622443     15.4
6 Friday         613845     17.0
7 Monday         588268     17.4

## Number of rides and average duration per month by user types (casual and member riders), in des order
all_trips %>%
+ group_by(month, user_type) %>%
+ summarise(total_rides = n(), avg_ride = mean(ride_length)) %>%
+ arrange(desc(total_rides)) %>% 
+ print(n=24)
`summarise()` has grouped output by 'month'. You can override using the `.groups` argument.
# A tibble: 24 × 4
# Groups:   month [12]
   month user_type total_rides avg_ride
   <chr> <chr>           <int>    <dbl>
 1 08    member         328576     13.4
 2 07    member         324304     13.8
 3 09    member         323287     13.3
 4 06    member         322256     13.9
 5 07    casual         306594     25.3
 6 09    casual         289979     26.4
 7 06    casual         287543     25.3
 8 10    member         284140     12.2
 9 05    member         277159     13.5
10 08    casual         265742     23.6
11 05    casual         216924     28.0
12 10    casual         187238     24.6
13 11    member         182919     11.1
14 04    member         177719     11.8
15 03    member         146494     11.9
16 12    member         129321     10.7
17 04    casual          90806     26.0
18 02    member          72682     10.8
19 11    casual          69232     20.4
20 01    member          66575     10.4
21 03    casual          66378     26.7
22 12    casual          44649     20.3
23 02    casual          14960     21.6
24 01    casual          12464     18.3

## Number of rides and average ride duration per month, in desc order 
> all_trips %>%
+ group_by(month) %>%
+ summarise(total_rides = n(), avg_ride = mean(ride_length)) %>%
+ arrange(desc(total_rides))
# A tibble: 12 × 3
   month total_rides avg_ride
   <chr>       <int>    <dbl>
 1 07         630898     19.3
 2 09         613266     19.5
 3 06         609799     19.3
 4 08         594318     17.9
 5 05         494083     19.9
 6 10         471378     17.1
 7 04         268525     16.6
 8 11         252151     13.6
 9 03         212872     16.5
10 12         173970     13.2
11 02          87642     12.7
12 01          79039     11.6

## Most frequent start hours 
 all_trips %>% 
+ count(start_hour) %>% 
+ arrange(desc(n)) %>% 
+ slice_head(n=10)
# A tibble: 10 × 2
   start_hour      n
   <chr>       <int>
 1 17         462228
 2 18         387850
 3 16         387676
 4 15         310864
 5 19         282446
 6 14         270340
 7 13         266425
 8 12         264992
 9 11         230787
10 08         220207

## (10) Most popular stations amongst member riders
> top_stations <- all_trips %>% 
+ count(start_station_name, user_type)
> top_stations %>% 
+ filter(user_type == 'member') %>% 
+ arrange(desc(n))
# A tibble: 1,227 × 3
   start_station_name           user_type     n
   <chr>                        <chr>     <int>
 1 Kingsbury St & Kinzie St     member    24815
 2 Clark St & Elm St            member    21854
 3 Wells St & Concord Ln        member    21381
 4 Wells St & Elm St            member    18917
 5 Clinton St & Madison St      member    18648
 6 Clinton St & Washington Blvd member    18466
 7 Ellis Ave & 60th St          member    17219
 8 Dearborn St & Erie St        member    16875
 9 Wells St & Huron St          member    16818
10 St. Clair St & Erie St       member    16779

## (10) most popular stations amongst casual riders 
> top_stations %>% 
+ filter(user_type == 'casual') %>% 
+ arrange(desc(n))
# A tibble: 1,293 × 3
   start_station_name                 user_type     n
   <chr>                              <chr>     <int>
 1 Streeter Dr & Grand Ave            casual    57146
 2 DuSable Lake Shore Dr & Monroe St  casual    30699
 3 Millennium Park                    casual    26026
 4 Michigan Ave & Oak St              casual    24888
 5 DuSable Lake Shore Dr & North Blvd casual    23798
 6 Shedd Aquarium                     casual    19687
 7 Theater on the Lake                casual    18253
 8 Wells St & Concord Ln              casual    16441
 9 Clark St & Armitage Ave            casual    13794
10 Clark St & Lincoln Ave             casual    13727

#### Visualizations with R #####
## Visualize daily ridership by User Type
ggplot(all_trips, aes( x = weekday, fill = user_type)) + geom_bar(position = "dodge") + 
scale_y_continuous(labels = scales::comma) + 
labs( x = "Day of the Week", y = "Ride Count", fill = "Member/Casual", title = "Total # of Rides per Day")
    


## Visualize average ride duration by User Type per day
ll_trips %>%
+ group_by(user_type, weekday) %>%
+ summarise(number_of_rides = n(), avg_duration = mean(ride_length)) %>%
+ arrange(weekday, user_type) %>%
+ ggplot(aes(x = weekday, y = avg_duration, fill = user_type)) + geom_col(position = "dodge") + 
labs (x="Day of the Week", y = "Average Ride Length(min)", title = "Average Ride Length by User Type and Day", fill = "Type of User")




