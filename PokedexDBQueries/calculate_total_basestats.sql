select name, id, (base_hp + base_atk + base_spdef + base_spd + base_def + base_spatk) as base_tot
from pokemon 
order by base_tot desc;