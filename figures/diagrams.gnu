set term pngcairo size 863,466 enhanced font "times,10"
set output "mcrad-diagram.png"
set style line 1 lw 1 lc rgb "#000000"
set style line 2 lw 1 lc rgb "#FF0000"

set style circle 

unset xlabel
unset ylabel
unset clabel
unset colorbox
unset key
unset xtic
unset ytic
unset cbtic

set yrange [-1:1]
set xrange [0:1]
set cbrange [0:1]

set isosamples 1000,1000

set palette define (0 "white", 1 "red")
set view map

set lmargin at screen 0
set rmargin at screen 1
set tmargin at screen 1
set bmargin at screen 0

r0 = 0.001
dr = 0.005
f(x,y) = exp(- 0.5 * y**2/(0.5*x**(3/2) + 0.1)*2) / (0.5*x**(3/2) + 0.1) / 10

xi = 0
yi = 0
mu = 0

splot f(x,y) with pm3d notitle, \
    '+' using (x=rand(0), y=2*rand(0)-1, z=r0+rand(0)*dr, x):(y):(1):(z) with circles lc rgb "#000000" fill solid, \
    '+' using (xi=($0==0 ? 0 : xi), xi):(yi=($0==0 ? -0.5 : yi), yi):(mu=($0==1 ? 0 : mu), mu = mu + invnorm(rand(0))/20, yi=yi+mu/10, xi=xi+sqrt(1-mu*mu)/10, 1) with linespoints lc rgb "#FF0088", \
    '+' using (xi=($0==0 ? 0 : xi), xi):(yi=($0==0 ?  0.0 : yi), yi):(mu=($0==1 ? 0 : mu), mu = mu + invnorm(rand(0))/5, yi=yi+mu/10, xi=xi+sqrt(1-mu*mu)/10, 1) with linespoints lc rgb "#FF0088", \
    '+' using (xi=($0==0 ? 0 : xi), xi):(yi=($0==0 ?  0.5 : yi), yi):(mu=($0==1 ? 0 : mu), mu = mu + invnorm(rand(0))/2, yi=yi+mu/10, xi=xi+sqrt(1-mu*mu)/10, 1) with linespoints lc rgb "#FF0088"
