# =====
# Doors
# =====

Doors = {};

Doors.new = func {
   obj = { parents : [Doors],
           door1 : aircraft.door.new("instrumentation/doors/door1", 25.0),
           door2 : aircraft.door.new("instrumentation/doors/door2", 25.0),
           door3 : aircraft.door.new("instrumentation/doors/door3", 25.0),
           door4 : aircraft.door.new("instrumentation/doors/door4", 25.0),
           door5 : aircraft.door.new("instrumentation/doors/door5", 25.0),
           door6 : aircraft.door.new("instrumentation/doors/door6", 25.0)
         };
   return obj;
};

Doors.door1export = func {
   me.door1.toggle();
}

Doors.door2export = func {
   me.door2.toggle();
}

Doors.door3export = func {
   me.door3.toggle();
}

Doors.door4export = func {
   me.door4.toggle();
}

Doors.door5export = func {
   me.door5.toggle();
}

Doors.door6export = func {
   me.door6.toggle();
}

# ==============
# Initialization
# ==============

# objects must be here, otherwise local to init()
doorsystem = Doors.new();

