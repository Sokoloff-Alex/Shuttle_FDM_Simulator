C:
cd C:\Program Files\FlightGear

SET FG_ROOT=C:\Program Files\FlightGear\\data
.\\bin\\win32\\fgfs --aircraft=shuttle --fdm=null --native-fdm=socket,in,30,127.0.0.1,5500,udp --native-ctrls=socket,out,30,127.0.0.1,5505,udp --fog-fastest --disable-clouds --start-date-lat=2004:06:01:09:00:00 --disable-sound --in-air --enable-freeze --airport=KSFO --runway=10L --altitude=10000 --heading=113 --offset-distance=6.48 --offset-azimuth=0
