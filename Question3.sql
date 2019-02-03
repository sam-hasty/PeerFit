select class_tag, 
		count(signed_in_at) as CompletedReservation
from clubready_reservations
where MONTH(signed_in_at) = 02
union
select class_tag, 
		count(checked_in_at) as CompletedReservation
from mindbody_reservations
where MONTH(checked_in_at) = 02
group by class_tag
order by CompletedReservation;
