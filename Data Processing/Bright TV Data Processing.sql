-- ==========================================================
-- CTE 1: Clean and standardize user profile information
-- ==========================================================
WITH user_profiles AS (

    SELECT
        UserID,

        -- Replace blank gender values with "None"
        CASE
            WHEN Gender = ' ' THEN 'None'
            ELSE Gender
        END AS Gender,

        -- Standardize missing or invalid race values
        CASE
            WHEN Race = 'other' THEN 'Unknown'
            WHEN Race = 'None' THEN 'Unknown'
            WHEN Race = ' ' THEN 'Unknown'
            ELSE Race
        END AS Race,

        -- Standardize missing province values
        CASE
            WHEN Province = 'None' THEN 'Uncategorized'
            WHEN Province = ' ' THEN 'Uncategorized'
            ELSE Province
        END AS Province,

        -- Categorize users into age groups
        CASE
            WHEN Age BETWEEN 0 AND 17 THEN 'Children & Teens'
            WHEN Age BETWEEN 18 AND 24 THEN 'Young Adults'
            WHEN Age BETWEEN 25 AND 34 THEN 'Early Adults'
            WHEN Age BETWEEN 35 AND 44 THEN 'Mid-Career Adults'
            WHEN Age BETWEEN 45 AND 54 THEN 'Mature Adults'
            WHEN Age >= 55 THEN 'Seniors'
        END AS age_group,

        -- Create a cleaned province category for reporting
        CASE
            WHEN Province = 'None' THEN 'Uncategorized'
            WHEN Province = ' ' THEN 'Uncategorized'
            ELSE Province
        END AS province_category,

        -- Flag users who have an email address
        -- 1 = Email exists, 0 = No email
        CASE
            WHEN (Email IS NOT NULL)
                 OR (Email = ' ')
                 OR (Email NOT IN ('None'))
            THEN 1
            ELSE 0
        END AS email_flag,

        -- Flag users who have a social media handle
        -- 1 = Social media handle exists, 0 = No handle
        CASE
            WHEN `Social Media Handle` IS NOT NULL
                 OR `Social Media Handle` = ' '
                 OR `Social Media Handle` NOT IN ('None')
            THEN 1
            ELSE 0
        END AS sm_flag

    FROM btv_user_profiles
),

-- ==========================================================
-- CTE 2: Clean and enrich TV viewership data
-- ==========================================================
viewership AS (

    SELECT

        -- Use the available UserID from either column
        COALESCE(UserID0, UserID4) AS userid,

        -- Create a Month ID (YYYYMM) for monthly reporting
        TO_CHAR(RecordDate2, 'yyyyMM') AS month_id,

        -- Extract viewing date
        TO_DATE(RecordDate2) AS watch_date,

        -- Extract day information
        DAYOFWEEK(RecordDate2) AS day_of_week,
        DAYNAME(RecordDate2) AS day_name,
        MONTHNAME(RecordDate2) AS month_name,

        -- Extract viewing time
        DATE_FORMAT(RecordDate2, 'HH:mm:ss') AS watch_time,

        -- Categorize viewing time into meaningful time-of-day buckets
        CASE
            WHEN watch_time BETWEEN '04:00:00' AND '05:59:59' THEN '01. Dawn'
            WHEN watch_time BETWEEN '06:00:00' AND '07:59:59' THEN '02. Sunrise'
            WHEN watch_time BETWEEN '08:00:00' AND '09:59:59' THEN '03. Morning'
            WHEN watch_time BETWEEN '10:00:00' AND '11:59:59' THEN '04. Forenoon'
            WHEN watch_time BETWEEN '12:00:00' AND '12:59:59' THEN '05. Noon'
            WHEN watch_time BETWEEN '13:00:00' AND '15:59:59' THEN '06. Afternoon'
            WHEN watch_time BETWEEN '16:00:00' AND '17:59:59' THEN '07. Dusk'
            WHEN watch_time BETWEEN '18:00:00' AND '19:59:59' THEN '08. Twilight'
            WHEN watch_time BETWEEN '20:00:00' AND '21:59:59' THEN '09. Evening'
            WHEN watch_time BETWEEN '22:00:00' AND '23:59:59' THEN '10. Night'
            WHEN watch_time BETWEEN '00:00:00' AND '03:59:59' THEN '11. Midnight'
        END AS time_of_day,

        -- Classify viewing day as Weekday or Weekend
        CASE
            WHEN day_name IN ('Sat', 'Sun') THEN 'Weekend'
            ELSE 'Weekday'
        END AS day_classification,

        -- Standardize channel names
        CASE
            WHEN Channel2 IN ('SawSee', 'Sawsee') THEN 'SawSee'
            WHEN Channel2 IN (
                'Supersport Live Events',
                'SuperSport Blitz',
                'SuperSport Live Events',
                'Live on SuperSport',
                'DStv Events 1'
            ) THEN 'SuperSport Live Channels'
            ELSE Channel2
        END AS TV_Channels,

        -- Extract viewing hour for hourly analysis
        HOUR(RecordDate2) AS hour_of_day,

        -- Format viewing duration
        DATE_FORMAT(`Duration 2`, 'HH:mm:ss') AS duration,

        -- Convert duration into minutes
        ROUND(
            HOUR(`Duration 2`) * 60 +
            MINUTE(`Duration 2`) +
            SECOND(`Duration 2`) / 60,
            2
        ) AS duration_minute,

        -- Categorize screen time into usage levels
        CASE
            WHEN duration BETWEEN '00:05:00' AND '00:30:00' THEN '01. Low Usage'
            WHEN duration BETWEEN '00:30:01' AND '00:59:59' THEN '02. Mid Usage'
            WHEN duration > '00:59:59' THEN '03. High Usage'
            ELSE 'No Usage'
        END AS screentime_brackets

    FROM btv_viewership
)

-- ==========================================================
-- Final Dataset
-- Combine cleaned viewership and user profile information
-- ==========================================================
SELECT

    -- Subscriber/User ID
    COALESCE(A.userid, B.userid) AS subs,


    -- Viewing information and User demographic information
    month_id,
    watch_date,
    day_of_week,
    day_name,
    month_name,
    day_classification,
    TV_Channels,
    province_category,
    hour_of_day,
    duration,
    duration_minute,
    screentime_brackets,
    time_of_day,Gender,
    age_group,
    Race,
    email_Flag,
    sm_flag

FROM viewership AS A

-- Join user demographics with viewing data
LEFT JOIN user_profiles AS B
    ON A.userid = B.UserID

-- Remove duplicate records
GROUP BY ALL;
