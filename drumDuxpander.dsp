declare name "drumDuxpander";
declare version "1.2.1";
declare author "Bart Brouns";
declare license "GPL-3.0-only";
declare copyright "2018 - 2023, Bart Brouns";

import("compressors.lib");

process = si.bus(nrChan) <: ro.interleave(nrChan,2)( drumDuxpander,drumDuck ) : par(i, nrChan, select2(SClisten,_,_)) ;
