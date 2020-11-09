select *
	from orders o
    join orderlines ol 
		on o.Id = ol.OrdersId
	join customers c
		on c.id = ol
        .ordersid