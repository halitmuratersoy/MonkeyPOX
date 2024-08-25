SELECT * FROM tbl_MPOX


--1 GLOBAL NUMBERS
CREATE VIEW GlobalNumbers
AS
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS deathPercentage
FROM tbl_MPOX
ORDER BY 1,2

select * from GlobalNumbers

--2 TOTAL DEATHS PER CONTINENT
CREATE VIEW TotalDeathsPerContinent
AS
SELECT location, SUM(new_deaths) AS TotalDeathCount
FROM tbl_MPOX
WHERE iso_code IS NULL AND location NOT IN ('Democratic Republic of Congo', 'World')
GROUP BY location
ORDER BY TotalDeathCount DESC


--3 TOAL CASES PER MILLION PER COUNTRY
CREATE VIEW TotalCasesPerMillionPerCountry
AS
SELECT location, MAX(CAST(total_cases_per_million AS FLOAT)) TotalCasesPerMillion
FROM tbl_MPOX
WHERE iso_code IS NOT NULL OR location IN('Democratic Republic of Congo')
GROUP BY location
ORDER BY TotalCasesPerMillion DESC


--4 HIGHEST INFECTION COUNT OVER DATE
CREATE VIEW HighestInfectionCountOverDate
AS
SELECT Location,  MAX(total_cases) AS HighestInfectionCount
FROM tbl_MPOX
WHERE iso_code IS NOT NULL OR location IN('Democratic Republic of Congo')
GROUP BY Location ORDER BY HighestInfectionCount DESC

