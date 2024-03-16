--Creating view to store data for visualizations
create view percentPopulationVaccinated as 
Select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date)
as RollingPeopleVaccinated
from PortfolioProjects_1.dbo.CovidDeaths dea
join PortfolioProjects_1.dbo.CovidVaccinations vac
	on dea.location=vac.location
	and dea.date=vac.date
where dea.continent is not null

select * from percentPopulationVaccinated

