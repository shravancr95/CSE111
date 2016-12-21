--picks out the best special sweepers in the game
select name, base_spatk, base_spd,  base_atk+base_hp+base_def+base_spatk+base_spdef+base_spd as tot from Pokemon where base_spatk >= 100 and base_spd > 90 order by tot desc;
