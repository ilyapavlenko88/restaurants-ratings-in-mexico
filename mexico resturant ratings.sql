
select*from [dbo].[consumer_preferences]
select*from  [dbo].[consumers]
select*from [dbo].[rating]
select*from [dbo].[restaurant_cuisines]
select*from[dbo].[restaurants]






------------------------------------------------------------------
--Most loved Cuisine----

with cte as (select cons.Consumer_ID,cons.Preferred_Cuisine,con.city,con.age,con.occupation,con.budget
from consumer_preferences cons
inner join consumers con 
on cons.Consumer_ID=con.Consumer_ID)


select  Preferred_Cuisine,count(Preferred_Cuisine) as 'Most loved Cuisine'
from cte
group by Preferred_Cuisine
order by 2 desc
------------------------------------------------------------------------------


	----top 5 restaurants (overall ratings)----
	with cte as (select res.Restaurant_ID, avg( Overall_Rating) as Overall,name
	from rating rat
	inner join restaurants res
	on rat.Restaurant_ID=res.Restaurant_ID
	group by res.Restaurant_ID, name)

	select   Overall  ,name
	from cte
	order by 1 desc
------------------------------------------------------


--AVG AGE BY  BUDGET----

SELECT
avg(case when Budget='low' then age end)as ' AVG AGE BY LOW BUDGET',
avg(case when Budget='medium' then age end)as ' AVG AGE BY MEIUM BUDGET',
avg(case when Budget='high' then age end)as ' AVG AGE BY HIGH BUDGET'
from consumers



select*from [dbo].[consumer_preferences]
select*from  [dbo].[consumers]
select*from [dbo].[rating]
select*from [dbo].[restaurant_cuisines]
select*from[dbo].[restaurants]
------------------------------------------------------------------
select con.Consumer_ID ,con.Preferred_Cuisine,cons.Age,cons.Budget,cons.Children,cons.City,cons.Drink_Level,cons.Marital_Status,cons.Occupation,cons.Smoker,cons.State,cons.Transportation_Method
from consumer_preferences con
left join consumers cons
on con.Consumer_ID=cons.Consumer_ID


select con.City,con.State,con.Smoker,con.Drink_Level,con.Transportation_Method,con.Marital_Status,con.Children,con.Age,con.Occupation,con.Budget,rat.Restaurant_ID,rat.Overall_Rating,rat.Food_Rating,rat.Service_Rating
from rating rat
left join consumers con
on rat.Consumer_ID=con.Consumer_ID


WITH cte as(select res.Restaurant_ID,rest.Name,rest.city,rest.state,rest.Alcohol_Service,rest.Smoking_Allowed,rest.price,rest.Franchise,rest.area,rest.Parking
from restaurant_cuisines res
inner join restaurants rest
on res.Restaurant_ID=rest.Restaurant_ID)

with cte as(select Name,city,State,Alcohol_Service,Smoking_Allowed,Price,Franchise,Area,Parking
from restaurants)


select name,price
from cte
where price in('low','medium','high')
group by name,price
order by price


