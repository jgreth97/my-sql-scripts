select city, state, sum(sales)
from Customers 
where state = 'OH'
group by city  
having sum(sales) > 600000    
    
