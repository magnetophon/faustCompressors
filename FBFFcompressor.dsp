declare author "Bart Brouns";
declare name "FBFFcompressor";
declare version "0.1";
declare license "GPLv3";

import("compressors.lib");

process =
FBFFcompressor_N_chan(strength,threshold,attack,release,knee,prePost,link,FBFF,meter,2);
