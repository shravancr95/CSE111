--dual type weakness
select attacker as weakness from 
(select sum(damage) as s,attacker, defender from 
(select attacker, defender, damage
from pokemon, type_matchup
where name = 'lapras' and defender = type1 and damage <> 0
union 
select attacker, defender, damage
from pokemon, type_matchup
where name = 'lapras' and defender = type2 and damage <> 0)
group by attacker) where s >= 3;