select member_id, studio_key, class_tag, reserved_for, signed_in_at		
from clubready_reservations
union all
select member_id, studio_key, class_tag, reserved_at, checked_in_at
from mindbody_reservations;