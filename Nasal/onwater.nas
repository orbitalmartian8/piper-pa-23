######################################################################
#                                                                    #
# If the plane is in the water, reassemble the  wheels on the floats #
#                                                                    #
# Helijah 03/2024                                                    #
######################################################################

setlistener("/sim/presets/latitude-deg", func {
  #print("*** ON WATER ? ***");
  settimer(func {
    var typ = getprop("/sim/type");
    var lat = getprop("/position/latitude-deg");
    var lon = getprop("/position/longitude-deg");
    var g = geodinfo(lat, lon);
    if (g != nil and g[1] != nil and g[1].solid) {
      #print("*** NO ***");
      setprop("controls/gear/gear-down",1);
      setprop("/sim/model/door-positions/gouvernes/position-norm",0);
    } else {
      #print("*** YES ***");
      setprop("controls/gear/gear-down",0);
      setprop("/sim/model/door-positions/gouvernes/position-norm",1);
    }
  }, 8);
}, 1);
