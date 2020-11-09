/*
select r.description, r.deliverymode, r.status, r.total, p.name, p.price, l.quantity,
(p.price * l.quantity) as 'Subtotal',
 concat(u.firstname, ' ',u.lastname) as 'Name', u.phonenumber
 */
 select r.description, sum(l.quantity * p.price) as 'total' from request r -- line total
	left join LineItem l on l.RequestID = r.id
	left join Product p on p.ID = l.ProductID
	left join Vendor v on v.id = p.vendorid
	left join user u on u.id = r.userid
group by r.description