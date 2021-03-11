/************************************************************************
 
 IMPORTANT NOTE : this file contains two clearly delimited sections :
 the ARCHITECTURE section (in two parts) and the USER section. Each section
 is governed by its own copyright and license. Please check individually
 each section for license and copyright information.
 *************************************************************************/

/*******************BEGIN ARCHITECTURE SECTION (part 1/2)****************/

/************************************************************************
 FAUST Architecture File
 Copyright (C) 2004-2021 GRAME, Centre National de Creation Musicale
 ---------------------------------------------------------------------
 This Architecture section is free software; you can redistribute it
 and/or modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either version 3
 of the License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public License
 along with this program; If not, see <http://www.gnu.org/licenses/>.
 
 EXCEPTION : As a special exception, you may create a larger work
 that contains this FAUST architecture section and distribute
 that work under terms of your choice, so long as this FAUST
 architecture section is not modified.
 
 ************************************************************************
 ************************************************************************/


#include "FaustMyOscDSP.hpp"

// XXX: For some reason this would result in a link error with it only defined inside Diode.
//constexpr const std::array<const FaustMyOsc::ParameterProperties, FaustMyOsc::numParameters> FaustMyOsc::parameters =
//{
//    ParameterProperties {  "Frequency",  "freq",  "",  20.0f,  20000.0f,  10.0f,  10000.0f,  true,  false,  false,  "",  ""  },
//    ParameterProperties {  "gaindB",     "gain",  "",  0.0f,   40.0f,     0.1f,   20.0f,     true,  false,  false,  "",  ""  }
//};

enum MyOscParameter {
    FaustMyOscParameterCutoff,
    FaustMyOscParameterGaindB
};

//using FaustMyOscDSP = SoulDSP<Diode>;
AK_REGISTER_DSP(FaustMyOscDSP)
AK_REGISTER_PARAMETER(FaustMyOscParameterCutoff)
AK_REGISTER_PARAMETER(FaustMyOscParameterGaindB)

/********************END ARCHITECTURE SECTION (part 2/2)****************/
