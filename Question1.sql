select count(signed_in_at)
from clubready_reservations			
where signed_in_at is not null AND (MONTH(signed_in_at) = 01 OR MONTH(signed_in_at) = 02)
union
select count(checked_in_at)
from mindbody_reservations
where checked_in_at is not null AND (MONTH(checked_in_at) = 01 OR MONTH(checked_in_at) = 02);
