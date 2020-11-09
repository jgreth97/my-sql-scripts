select city, sum(sales)
	from Customers
    group by city, state
	having sum(sales) > 600000 
    -- having city = ('Cincinnati' or city = 'Columbus');
	--  having city in ('Cincinnati' , 'Columbus');