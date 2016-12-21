select attacker as weakness from 
(select sum(damage) as s,attacker from 
(select attacker, defender, damage
from pokemon, type_matchup
where name = 'venusaur' and defender = type1 and damage <> 0
union all 
select attacker, defender, damage
from pokemon, type_matchup
where name = 'venusaur' and defender = type2 and damage <> 0)
group by attacker) where s >= 3;