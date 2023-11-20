/*create database Brewry*/
use  Brewry;
/*PROFIT ANALYSIS*/

/*Q1..Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?*/;

SELECT SUM(Profit) as Profith_Worth
From Brewery

/* Q2..Compare the total profit between these two territories in order for the territory
manager, Mr. Stone made a strategic decision that will aid profit maximization in 2020*/;

 Select distinct
	(SELECT SUM(profit) AS total_anglophone_profit FROM Brewery WHERE countries in ('Nigeria','Ghana')),
	(SELECT SUM(profit) AS total_francophone_profit FROM Brewery WHERE  countries in ('Togo','Senegal','Benin'))

	
	/* Q3..Country that generated the highest profit in 2019*/;
	
    SELECT Countries,Sum(Profit) as total_profitmade 
	FROM Brewery 
	where years= 2019
	group by countries 
	order by total_profitmade desc limit 1

    /*Q4.. Help him find the year with the highest profit.*/;

	 SELECT YEARS,SUM(Profit) as Highest_ProfitYear 
	 from Brewery 
	 where years in(2017,2018,2019) 
	 group by years 
	 order by Highest_ProfitYear desc limit 1
      
/*Q5.. Which month in the three years was the least profit generated?*/;
	 
	 SELECT MONTHS ,Sum(Profit) as Least_Profit
	 from Brewery 
	 group by MONTHS 
	 order by Least_Profit 
    
/*Q6..What was the minimum profit in the month of December 2018?*/;
	
	SELECT Months,years, MIN(Profit) as Minimum_Profit
	  from Brewery 
	  where MONTHS='december' and  years= 2018
	  group by MONTHS,YEARS
	  


/* Q7..Compare the profit in percentage for each of the month in 2019*/;
	 select Months, Sum(Profit)as MonthlyProfit,
	  (Sum(Profit) *100.0/(SELECT Sum(Profit) From Brewery where YEARS = 2019 ))As Profit_Percentage 
	  From Brewery
	  where years = 2019 
	  group by MONTHS
	  order by MONTHS
	  

/*Q8.. Which particular brand generated the highest profit in Senegal?*/;
	 
     Select Brands,Countries ,Sum(Profit) as highest_brand
	  from Brewery 
	  where COUNTRIES ='Senegal' 
	  group by BRANDS,COUNTRIES 
	  order by highest_brand desc 
	  

	  
	  
	  /*BRAND ANALYSIS*/;

/*Q1..Within the last two years, the brand manager wants to know the top three brands consumed in the
francophone countries*/;
	 
     Select brands, sum(quantity) as Highest_Consumed
	  from Brewery 
	  where countries in('togo','benin','Senegal') and years in(2018,2019)
	  group by brands 
	  order by Highest_Consumed desc Limit 3
	

/*Q2.. Find out the top two choice of consumer brands in Ghana*/;
	  
	  SELECT BRANDS,SUM(Quantity)as Top_Consumer 
	   from Brewery where COUNTRIES= 'Ghana' 
	   group by BRANDS 
	   order by Top_Consumer desc
	  

/*Q3..Find out the details of beers consumed in the past three years in the most oil rich country in West
Africa.*/;

		SELECT Brands,
		  Sum(Profit) as Total_Profit,
		  SUM(Quantity)as Total_Qty,
		  Sum(cost) as Total_Cost from Brewery where countries= 'Nigeria' and years in (2017,2018,2019) group by BRANDS
      
/*Q4.. Favorites malt brand in Anglophone region between 2018 and 2019*/;
		 
		 Select brands,Sum(Quantity) from Brewery
		  where  BRANDS like '%Malt%' and years in(2018,2019) and COUNTRIES in('Ghana','Nigeria')
		  group by BRANDS 
		  order  by Sum(Quantity)desc		  
		  
/*Q5 Which brands sold the highest in 2019 in Nigeria?*/;
		
		SELECT Brands,
		Sum(QUANTITY) as Highest_SoldNg  from Brewery 
		where COUNTRIES = 'Nigeria' and years= 2019
		group by BRANDS 
		order by Highest_SoldNg desc
	
/*Q6 Favorite brand in South South region in Nigeria*/;
		
        SELECT Brands, Sum(Quantity)as Quantity_Sold 
		from Brewery 
		where REGION = 'SouthSouth' and COUNTRIES= 'Nigeria' 
		group by BRANDS 
		order by Quantity_Sold desc
     

	 /*Q7..Level of consumption of Budweiser in the regions in Nigeria*/;
	 
     SELECT Brands,Region,Sum(Quantity) as Total_Consumed 
	  From Brewery 
	  where Brands like '%budweiser%'and COUNTRIES='Nigeria'
	  group by BRANDS,Region
	  order by Total_Consumed desc

	/*Q8... Level of consumption of Budweiser in the regions in Nigeria in 2019 */;
    
	SELECT Brands,Region,Sum(Quantity) as Total_Consumed 
	  From Brewery 
	  where Brands like '%budweiser%'and COUNTRIES='Nigeria' and YEARS =2019
	  group by BRANDS,Region
	  order by Total_Consumed desc
	


	   /*SECTION(C) GEO-LOCATION ANALYSIS*/;
	   
	   /*(i).Country with the highest consumption of beer*/
	  
	  SELECT COUNTRIES,Sum(Quantity) as Level_Consumed
	   from Brewery 
	   where BRANDS not like '%Malt%' 
	   group by COUNTRIES
	   order by Level_Consumed

	 /*(ii). Highest sales personnel of Budweiser in Senegal*/;
     
	 SELECT SALES_REP,Sum(Quantity) as Sales ,Sum(Profit) as Total_Profit
	  from Brewery 
	  where  BRANDS = 'budweiser' and COUNTRIES = 'Senegal'
	  group by SALES_REP
	  order by Sales desc

	 /*(iii).Country with the highest profit of the fourth quarter in 2019*/;
	 
	 SELECT COUNTRIES ,Sum(Profit) as Total_Profit
	  from Brewery 
	  where MONTHS In('October','November','December') and years = 2019
	  group by COUNTRIES
	  order by Total_Profit desc



