select member_id,
		Reservations,
		Complete
from (select member_id,
				count(reserved_for) as Reservations,
				count(signed_in_at) as Complete
		from clubready_reservations
		where MONTH(reserved_for) = 02
		group by member_id) as subquery
union
select member_id,
		Reservations,
		Complete
from (select member_id,
				count(reserved_at) as Reservations,
				count(checked_in_at) as Complete
		from mindbody_reservations
		where MONTH(reserved_at) = 02
		group by member_id) as subquery
order by Reservations, Complete;