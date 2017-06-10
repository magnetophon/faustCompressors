declare author "Bart Brouns";
declare name "FBFFcompressor_mono";
declare version "1.2";
declare license "GPLv3";

import("compressors.lib");

process =
FBFFcompressor_N_chan(strength,threshold,attack,release,knee,prePost,link,FBFF,meter,1);
