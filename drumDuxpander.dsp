declare author "Bart Brouns";
declare version "1.0";
declare license "GPLv3";

import("compressors.lib");

process = bus(nrChan) <: interleave(nrChan,2)( drumDuxpander,drumDuck ) : par(i, nrChan, select2(SClisten,_,_)) ;
