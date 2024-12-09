from pkgutil import extend_path
__path__ = extend_path(__path__, __name__)
import sys
import os
sys.path.append(os.getcwd() + "/trick.zip/trick")

import _sim_services
from sim_services import *

# create "all_cvars" to hold all global/static vars
all_cvars = new_cvar_list()
combine_cvars(all_cvars, cvar)
cvar = None

# /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/S_source.hh
import _mcc3aa680d110b2cef781526b89cd7469
combine_cvars(all_cvars, cvar)
cvar = None

# /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/models/satellite/include/Satellite.hh
import _m2d7c369471cac3e20a0505ea0a9f0f94
combine_cvars(all_cvars, cvar)
cvar = None

# /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/S_source.hh
from mcc3aa680d110b2cef781526b89cd7469 import *
# /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/models/satellite/include/Satellite.hh
from m2d7c369471cac3e20a0505ea0a9f0f94 import *

# S_source.hh
import _mcc3aa680d110b2cef781526b89cd7469
from mcc3aa680d110b2cef781526b89cd7469 import *

import _top
import top

import _swig_double
import swig_double

import _swig_int
import swig_int

import _swig_ref
import swig_ref

from shortcuts import *

from exception import *

cvar = all_cvars

