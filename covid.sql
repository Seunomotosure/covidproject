-- table preview
select *
from covid.dbo.[covid death]
where continent is not null


 --totaldeath vs totalcases[deathpercentage].....likelihood of dying if you contract covid in your country
select location, date, total_deaths,total_cases,(cast(total_deaths as float))/total_cases*100    as [deathpercentage(%)] 
from COVID.dbo.[Covid death] 
where continent is not null


 --total_cases vs population[contractpercentage].....likelihood of contracting covid in your country
select  location,date, population,total_cases,(total_cases/population)*100 as[ contractpercentage(%)]
from covid.dbo.[Covid death]
where continent is not null


 --looking at country with hihest contraction prcentage
 select  location,population,total_cases,max((total_cases/population)*100) as[ contractpercentage(%)]
from covid.dbo.[Covid death]
where continent is not null
group by location,population,total_cases
order by [ contractpercentage(%)]desc
 


--looking at countries with highest deathcount compare to population
select  location , population,total_deaths ,total_deaths/population as deathtopopulationratio
from covid.dbo.[Covid death]
 where continent is not null
 order by deathtopopulationratio desc

                   --------------BREAKING THINGS DOWN BY CONTINENTS ---------------
--total death in each continent
SELECT continent, sum (total_deaths*1) as[total death in continent]
from COVID.dbo.[Covid death]
where continent is not null
group by continent 


--continent with the highest death count 
SELECT continent, sum (total_deaths*1) as[total death in continent]
from COVID.dbo.[Covid death]
where continent is not null
group by continent 
order by [total death in continent] desc



--total_cases and total_death in the world daily

select date,sum(new_cases) as totalcases,sum(new_deaths) as totaldeaths  
from COVID.dbo.[Covid death]
where continent is not null 
group by date
order by  totaldeaths desc




--total death and case in the world
select    sum(cast(new_deaths as float)) deaths,sum(cast(new_cases as float)) cases, sum(cast(new_deaths as float))/sum(cast(new_cases as float)) *100 deathpercentageworldwide
from COVID.dbo.[Covid death]


       ------------COVID VACCINATION----------
	   --viewing table to be used
	   SELECT *
	   FROM COVID.DBO.[' covid vaccination']
--totalpopulation vs total vaccination
	   select vac.continent,dea.location,date,new_vaccinations,total_vaccinations,dea.population ,
	   total_vaccinations/dea.population*100
	   from COVID..[' covid vaccination'] vac
	   join COVID..[Covid death] dea
	   on  vac.location=dea.location
	   and  dea.continent=vac.continent 
	    group by  vac.continent,dea.location,date,new_vaccinations,total_vaccinations,dea.population 
 

	   


 
 
 
 
 


 