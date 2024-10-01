-- SQL Queries

-- 1. Total Cases by Country
-- Retrieve a list of African countries along with their total Covid-19 cases. 
-- Sort this list in descending order to highlight countries with the highest case counts.
SELECT country_other AS country, total_cases
FROM covid_africa
ORDER BY total_cases DESC;

-- 2. Countries with High Deaths Per Capita
-- Find countries where the deaths per 1 million population exceed a certain threshold (e.g., 500). 
SELECT country_other AS country, deaths_1m_pop AS Deaths_per_1M_Population
FROM covid_africa
WHERE deaths_1m_pop > 500
ORDER BY 2 DESC;

-- 3. Active Cases vs. Recovered Cases
-- Compare active cases to recovered cases for each country. 
-- Calculate the percentage of active cases relative to total recovered cases.
SELECT country_other AS country, 
    ROUND(((active_cases / total_recovered) * 100), 2) AS percentage_active_cases_vs_recovered
FROM covid_africa
WHERE total_recovered > 0
ORDER BY 2 DESC, 1 ASC;

-- 4. Mortality Rate Calculation
-- Calculate the mortality rate (deaths/total cases) for each country,
-- and sort the countries by this rate to identify which had the highest mortality.
SELECT country_other AS country, ROUND(((total_deaths / total_cases) * 100), 2) AS percentage_mortality_rate
FROM covid_africa
WHERE total_cases > 0
ORDER BY 2 DESC;

-- 5. Total Cases by Region
SELECT continent AS region, SUM(total_cases) AS total_cases
FROM covid_africa
GROUP BY region
ORDER BY total_cases DESC;
