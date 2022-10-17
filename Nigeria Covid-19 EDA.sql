/*view the data*/
SELECT*
FROM covid_deaths;

/*total cases of covid-19 that occurred in Nigeria*/
SELECT covid_deaths.location, SUM(total_cases) AS total_cases
FROM covid_deaths
WHERE location = 'Nigeria'
GROUP BY  covid_deaths.location;

/*What percentage of the Nigerian population had covid*/
SELECT location, population, total_cases, (total_cases::float/population)*100 AS population_Percentage_with_covid
FROM covid_deaths
WHERE location = 'Nigeria'
ORDER BY population_Percentage_with_covid DESC;

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

/*What is the highest infection rate compared to population in Nigeria*/
SELECT location, population, MAX(total_cases) AS max_case, MAX((total_cases::float/population))*100 AS high_infection_rate
FROM covid_deaths
WHERE location LIKE '%Nigeria%'
GROUP BY population, location
ORDER BY high_infection_rate DESC;

/*the highest death per population in Nigeria*/
SELECT covid_deaths.location, covid_deaths.population, MAX(total_deaths) AS max_death, MAX((total_deaths::float/population))*100 AS percent_death
FROM covid_deaths
WHERE location LIKE '%Nigeria%'
GROUP BY covid_deaths.population, covid_deaths.location
ORDER BY max_death, percent_death ASC;

/*what are the total new cases of covid-19 in Nigeria*/
SELECT location, SUM(new_cases) As Total_new_cases
FROM covid_deaths
WHERE location LIKE '%Nigeria%'
GROUP BY location;

/*what are the total deaths that occurred in Nigeria due to Covid-19*/
SELECT location, SUM(total_deaths) As total_deaths
FROM covid_deaths
WHERE location LIKE '%Nigeria%'
GROUP BY location;

/* Total of new deaths due to covid-19 in Nigeria*/
SELECT location, SUM(new_deaths) As total_new_deaths
FROM covid_deaths
WHERE location LIKE '%Nigeria%'
GROUP BY location;

/*Total count of covid-19 cases that occurred in Nigeria*/
SELECT location, COUNT(date)
FROM covid_deaths
WHERE location = 'Nigeria';
