select count(member_id)			
from ( select member_id,		
			count(reserved_for) as NumberofReservations,
			count(canceled = true) as NumberofCancellations
		from clubready_reservations
		where MONTH(reserved_for) = 01
		group by member_id) as subquery
where NumberofReservations > 0 AND NumberofCancellations < 2        			
union			
select count(member_id)			
from ( select member_id,		
			count(reserved_at) as NumberofReservations,
			count(canceled_at) as NumberofCancellations
		from mindbody_reservations
		where MONTH(reserved_at) = 01
		group by member_id) as subquery
where NumberofReservations > 0 AND NumberofCancellations < 2;	