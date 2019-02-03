select case 
		when date_format(signed_in_at, '%H:%i:s') between '07:00:00' and '11:59:59' then 'morning' 
		when date_format(signed_in_at, '%H:%i:s') between '12:00:00' and '16:59:59' then 'afternoon' 
		when date_format(signed_in_at, '%H:%i:s') between '17:00:00' and '22:59:59' then 'evening' 
        when date_format(signed_in_at, '%H:%i:s') between '23:00:00' and '24:59:59' then 'after 11'
        when signed_in_at is null then 'missed'
		end as bucket,
		count(1) as cnt
from clubready_reservations
union
select case 
		when date_format(checked_in_at, '%H:%i:s') between '07:00:00' and '11:59:59' then 'morning' 
		when date_format(checked_in_at, '%H:%i:s') between '12:00:00' and '16:59:59' then 'afternoon' 
		when date_format(checked_in_at, '%H:%i:s') between '17:00:00' and '22:59:59' then 'evening'
        when date_format(checked_in_at, '%H:%i:s') between '23:00:00' and '24:59:59' then 'after 11'
        when checked_in_at is null then 'missed'
		end as bucket,
		count(1) as cnt
from mindbody_reservations
group by bucket;