declare author "Bart Brouns";
declare version "0.1.1";
declare license "GPLv3";

import("compressors.lib");

process = bus(nrChan) <: interleave(nrChan,2)( drumDuxpander,drumDuck ) : par(i, nrChan, select2(SClisten,_,_)) ;
