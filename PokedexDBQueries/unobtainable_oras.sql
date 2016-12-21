--selects all pokemon that cannot be obtained in omega_ruby and alpha sapphire
select name from locations where omega_ruby='Trade from X & Y' or  alpha_sapphire='Trade from X & Y';
