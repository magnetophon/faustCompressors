declare name "FBFFcompressor_mono";
declare version "1.2.1";
declare author "Bart Brouns";
declare license "GPL-3.0-only";
declare copyright "2018 - 2023, Bart Brouns";

import("compressors.lib");

process =
FBFFcompressor_N_chan(strength,threshold,attack,release,knee,prePost,link,FBFF,meter,1);
