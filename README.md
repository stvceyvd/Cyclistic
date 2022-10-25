# Case Study - How Does a Bike-Share Navigate Speedy Success?
### Introduction
In this case study, I will be following the steps of data analysis taught in the [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics?utm_source=google&utm_medium=institutions&utm_campaign=gwgsite-gDigital-paidha-sem-bk-gen-exa-glp-br-null&_ga=2.244797261.950290879.1660862123-1096932820.1658185357&_gac=1.149812676.1658444207.Cj0KCQjw8uOWBhDXARIsAOxKJ2HwpFHSnMZDJDQv74Qkx3-MUYDeY6LNt4vm-XZ9zN0puUniH0tZM0kaAlafEALw_wcB) course -- ask, prepare, process, analyze, share, and act -- as a junior data analyst in the marketing analyst team for a fictional bike-share company, Cyclistic. 

### About Cyclistic 
Based in Chicago, Cyclistic is a bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to
commute to work each day. 

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.


### Scenario 
The director of marketing, Lily Moreno, believes the company’s future success depends on maximizing the number of annual memberships. Therefore, the team needss to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, we will design a new marketing strategy to convert casual riders into annual members. 

### Business Task 
Analyze Cyclistic historical bike trip data to identify trends and better understand the differences between **casual riders** and **annual riders**, and apply these insights into new design marketing strategies. 

**Primary Stakeholders** 

- Lily Moreno: The director of marketing and your manager. Moreno is responsible for the development of campaigns
and initiatives to promote the bike-share program. These may include email, social media, and other channels.

- Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the
recommended marketing program.

**Secondary Stakeholders** 

- Cyclistic Marketing Analytics Team: A team of data analysts who are responsible for collecting, analyzing, and
reporting data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy
learning about Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic
achieve them.

### About the Data
Provided by Google, the datasource used for this case study can be found [here](https://divvy-tripdata.s3.amazonaws.com/index.html), made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement). 

**Limitations**
Using the ROCCC approach learned during the course, I will address any limitations within the data set. 
- Reliability: There is a total of 4,487,941 bike trips to be analyzed in this case study. This is a large dataset that will provide more accurate values that will better represent the bike trips in Chicago during the period of investigation. 
- Original: The data has been collected by the city of Chicago's ("City") Divvy bicycle sharing service, powered by Lyft, indicating there is a direct relationship between the entity and users. Additionally, it is made available by Motivate International Inc. under an agreement license. 
- Comprehensive: Dataset contains the variables (start/end time, station ids, rideable type, etc.) that are necessary to understand how casual and member riders use bikesharing services differently. 
- Current: The data is reflects current trends, as the datasource is periodically updated. For my analysis, I have also decided to use the most recent collected data to ensure its relevancy. 
- Cited: The data was collected by Lyft Bikes and Scoots, LLC ("Bikeshare"), which operates the City of Chicago's Divvy Bicycle Sharing service. This data has been permitted to be available to the public, by the city and under a Data License Agreement, making it a reliable source of data. 

Overall, this data set does meet the ROCCC standard and is recommendeded to make business decisions. 

For my analysis, I've decided to **focus** on the data from the past year (Sept 2021 - August 2022), using 12 CSV files from the link shared above. 

### Data Processing
For this case study, I used entirely R Studio to process, clean, transform, analyze, and visualize the data. I began the clean process by checking for: empty rows, duplicates, misleading records, N/A values, and any inconsistencies. View my changelog [here](https://github.com/stvceyvd/Cyclistic/blob/main/Cyclistic.R).

### Data Visualizations 

![39c6bbf2-9ff4-4265-bc63-6a6214a81840](https://user-images.githubusercontent.com/109622742/197674566-c2cf67b2-bb0e-4ab7-b0c2-5b93f99a095f.png)

![4acee084-ab59-46e8-bc0d-c5f4af5a1ca5](https://user-images.githubusercontent.com/109622742/197674577-1cc3164c-d003-4017-bfaf-3094ddbd1ea4.png)

![538c6b89-a411-4b5f-bc4f-ae0be68772df](https://user-images.githubusercontent.com/109622742/197674585-12e4484f-4f3f-4d2a-b75b-1296fda99935.png)

![60322ae7-4dc2-42f0-b120-04b7d5292e8f](https://user-images.githubusercontent.com/109622742/197674594-23e53d7c-3e69-4456-a563-c959be54d71a.png)

![f21fbcfc-b294-456a-a245-75f25ea8d7e0](https://user-images.githubusercontent.com/109622742/197674600-96c25d27-4f77-42a2-a41f-5e99a44c22a5.png)

![fc1a20e8-ef2b-4b8e-af53-79826db4c343](https://user-images.githubusercontent.com/109622742/197674610-76018608-84a5-4588-9766-a529c7c463f2.png)

## Insights: 
- Members ride more on weekdays (mainly for commutes during rush hour), compared to casual riders. 
- Casual riders use the bike-sharing service more on weekends (mainly for leisure).
- Although members ride more overall, casual riders travel nearly 50% longer than member riders. 
- For both casual and member riders, travel peak time is around 4:30-6:30 PM. However, we see that there are more casual rides around that time.   
- Bike-sharing service is more popular in the Spring/Summer/Fall season (April-October) than in the Winter season (November-March). 

## Recommendations: 
- Run a promotion/sale for annual memberships at the beginning of the surge (April) to entice casual members to upgrade their plan for the summer.  
- Increase the price for single fares on the weekends when there are more casual riders traveling. Doing this will encourage casual riders to upgrade their membership plan in order to save and avoid the high cost. 
- Offer discounts on fares (during peak hour) as in incentive to upgrading rider membership plan. 

