select *
from PortfolioProjects_1.dbo.CovidDeaths
where continent is not null
order by 3,4

select *
from PortfolioProjects_1.dbo.CovidVaccinations
order by 3,4

Select location,date,total_cases,new_cases,total_deaths,population
from PortfolioProjects_1.dbo.CovidDeaths
order by 1,2

--Looking at Total Cases by Total Deaths
Select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage
from PortfolioProjects_1.dbo.CovidDeaths
where location ='United States'
order by 1,2

-- Looking at Total Cases vs Population
-- Shows what percentage of population got covid
Select location,date,population,total_cases,(total_cases/population)*100 as DeathPercentage 
from PortfolioProjects_1.dbo.CovidDeaths
where location ='United States'
order by 1,2

--Countries with Highes infection rate with Population
Select location,population,max(total_cases) as HighestInfectionCount,max((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProjects_1.dbo.CovidDeaths
group by location,population
order by PercentPopulationInfected desc

-- Countries with highest death count per Population
Select location,max(cast(total_deaths as int)) as totalDeathCount
from PortfolioProjects_1.dbo.CovidDeaths
where continent is not null
group by location
order by totalDeathCount desc


--Continents with highest death counts
Select continent,max(cast(total_deaths as int)) as totalDeathCount
from PortfolioProjects_1.dbo.CovidDeaths
where continent is not null
group by continent
order by totalDeathCount desc


--Global Numbers
Select sum(new_cases) as total_cases , SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as Death_Percentage
from PortfolioProjects_1.dbo.CovidDeaths
where continent is not null
order by 1,2

