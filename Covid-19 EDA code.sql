/*To view the data*/
SELECT*
FROM covid_deaths;

/*Rename column "loca" to "location"*/
ALTER TABLE covid_deaths
RENAME COLUMN loca TO location;

/*We begin Data Exploration*/
SELECT date, location, population, new_cases, total_cases, total_deaths
FROM covid_deaths
ORDER BY location;

/*We need to know the percentage of people who got infected or was diagnosed by the virus we use the total_cases vs total_deaths which are both integer, so we cast one of them to float as we divide this is because in postgresql, integer divided by another integer truncates the fractional part especially if its an improper fraction*/
SELECT date, location, total_deaths, total_cases, (total_deaths/total_cases::float)*100 AS Death_Percentage
FROM covid_deaths
Order BY location, death_percentage;

/*What is the total_cases of covid in Nigeria?*/
SELECT covid_deaths.location, SUM(total_cases) as total_cases
FROM covid_deaths
WHERE location = 'Nigeria'
GROUP BY covid_deaths.location
ORDER BY location, total_cases;

/*What is the total_cases of covid in Nigeria on 2021-04-28?*/
SELECT date, location, total_cases
FROM covid_deaths
WHERE location = 'Nigeria' AND date = '2021-04-28'
ORDER BY location;

/*What percentage of deaths occurred due to Covid_cases in Nigeria?*/
SELECT location, total_deaths, (total_deaths/total_cases::float)*100 AS death_Percent
FROM covid_deaths
WHERE location LIKE '%Nigeria%'
ORDER BY death_percent;

/*What is the highest death that occurred in Nigeria due to covid-19?*/
SELECT location, population, MAX(total_deaths) As max_death
FROM covid_deaths
WHERE location = 'Nigeria'
GROUP BY location, population
ORDER BY max_death;

/*What percentage of Nigerian population have covid*/
SELECT location, population, total_cases, (total_cases::float/population)*100 AS population_Percentage_with_covid
FROM covid_deaths
WHERE location = 'Nigeria'
ORDER BY population_Percentage_with_covid DESC;

/*Which country had the highest infection rate compared to population*/
SELECT location, population, MAX(total_cases) AS max_case, MAX((total_cases::float/population))*100 AS high_infection_rate
FROM covid_deaths
GROUP BY population, location
ORDER BY high_infection_rate DESC;

/*countries with the highest death count per population*/
SELECT covid_deaths.location, covid_deaths.population, MAX(total_deaths) AS max_death,MAX((total_deaths::float/population))*100 AS percent_death
FROM covid_deaths
GROUP BY covid_deaths.population, covid_deaths.location
ORDER BY max_death, percent_death ASC;

/*countries with the highest cases per population*/
SELECT location, population, MAX(total_cases) AS max_cases, MAX((total_cases::float/population))*100 AS highest_infection
FROM covid_deaths
GROUP BY population, location
ORDER BY highest_infection DESC;

/*The highest cases in Nigeria per population*/
SELECT location, population, MAX(total_cases) AS max_cases, MAX((total_cases::float/population))*100 AS highest_infection
FROM covid_deaths
WHERE location = 'Nigeria'
GROUP BY population, location
ORDER BY highest_infection DESC;

/*Countries with Highest death*/
SELECT location, MAX(total_deaths::int) AS max_death
FROM covid_deaths
WHERE location IS NOT NULL AND Continent IS NOT NULL
GROUP BY location
ORDER BY location, max_death DESC;

/*Continent with Highest death*/
SELECT covid_deaths.continent, MAX(total_deaths::int) AS max_death
FROM covid_deaths
WHERE Continent IS NOT NULL
GROUP BY covid_deaths.continent
ORDER BY covid_deaths.continent, max_death DESC;

/*location with Highest death*/
SELECT covid_deaths.location, MAX(total_deaths::int) AS max_death
FROM covid_deaths
WHERE continent IS NULL
GROUP BY covid_deaths.location
ORDER BY max_death DESC;

/*Continent with the highest death Per Population*/
SELECT continent, MAX(total_deaths::int/population) AS max_death_population
FROM covid_deaths
WHERE covid_deaths.continent IS NOT NULL
GROUP BY covid_deaths.continent
ORDER BY max_death_population DESC;

/*GLOBAL NUMBERS*/
SELECT covid_deaths.date, covid_deaths.total_cases, covid_deaths.total_deaths, MAX(total_deaths/total_cases)*100 AS Death_percent
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY covid_deaths.date, covid_deaths.total_cases,covid_deaths.total_deaths
ORDER BY Death_percent DESC;