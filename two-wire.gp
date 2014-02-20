#We use millimeters without fixes here because we just need ratio.
set terminal postscript eps enhanced
set output "2wire_open.eps"
set title "Two-wire open line, 1mm diameter."
set samples 300
set xrange [1:200]
set xlabel "Distance between conductors, mm"
set ylabel "Impedance, Ohm"
set grid
plot (377.0/pi)*log(2.0*x) with lines title "Analytical formula."

set output "2wire_open_broken.eps"
plot (377.0/pi)*log(2.0*x) with lines title "Analytical formula.",\
	"Open_broken.txt" u 1:2 with lines title "Simulation (Not working)"

set output "WAGPT.eps"
set title "Wire above ground plane, 1mm diameter."
set xlabel "Height h, mm"
plot (377.0/(2.0*pi))*log(4.0*x) with lines title "Analytical formula."

set output "WAGP.eps"
set title "Wire above ground plane, 1mm diameter."
set xlabel "Height h, mm"
plot (377.0/(2.0*pi))*log(4.0*x) with lines title "Analytical formula.",\
	"WOFPB.txt" u 1:2 with lines title "Simulation."

set xrange [1:200]
set output "Parallel_plate.eps"
set title "Parallel plate, 1mm spacing."
set xlabel "Plate width w, mm"
plot (377.0*(1.0/x)) with lines title "Analytical formula.",\
     "PPLATE.txt" u 1:2 with lines title "Simulation #1.",\
     "PPLATE2fix.txt" u 1:2 with linespoints title "Simulation #2."
#     "PPLATE2fix.txt" u 1:2 with points notitle
