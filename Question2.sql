select studio_key, 
		TotalReservationsPerStudio, 
		TotalReservationsAttended,
		(TotalReservationsPerStudio - TotalReservationsAttended) as AbandonmentRate
from ( select studio_key,
				count(reserved_for) as TotalReservationsPerStudio,
				count(signed_in_at) as TotalReservationsAttended
		from clubready_reservations
		group by studio_key) as subquery
union all 
select studio_key, 
		TotalReservationsPerStudio, 
		TotalReservationsAttended,
		(TotalReservationsPerStudio - TotalReservationsAttended) as AbandonmentRate
from ( select studio_key,
			count(reserved_at) as TotalReservationsPerStudio,
			count(checked_in_at) as TotalReservationsAttended
		from mindbody_reservations
		group by studio_key) as subquery
order by AbandonmentRate;
