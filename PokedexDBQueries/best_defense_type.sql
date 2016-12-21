--selects overall best defensive pokemon of each type

select name, base_hp, base_atk, base_def, base_spatk, base_spdef, base_spd from (select base_hp+base_def+base_spdef as h, name, base_hp, base_atk, base_def, base_spatk, base_spdef, base_spd from pokemon where (type1='grass' or type2='grass')) order by h desc;