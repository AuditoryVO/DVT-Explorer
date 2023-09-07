;2022
<Cabbage>
form caption("TESS DVT Explorer") size(930, 400), colour(45, 45, 50), pluginID("DVT Explorer")

image bounds(72, 21, 826, 281) identchannel("Image") corners(10) file("Init_DVT.png") 

image bounds(54, 310, 865, 81), channel("deco1"), colour(65,65,70), corners(10)
image bounds(4, 9, 46, 382), channel("deco2"), colour(65, 65, 70, 255), corners(10)
image bounds(72, 20, 827, 283), channel("deco3"), colour(25, 25, 25, 255), corners(10) alpha(0.2) outlinethickness(1)


texteditor bounds(118, 358, 74, 19) channel("texteditor") identchannel("editorIdent0") colour:0(80, 80, 80, 255) fontcolour(200,200,200);Teff
texteditor bounds(252, 358, 74, 19) channel("texteditor") identchannel("editorIdent1") colour:0(80, 80, 80, 255) fontcolour(200,200,200);Metallicity
texteditor bounds(384, 358, 74, 19) channel("texteditor") identchannel("editorIdent2") colour:0(80, 80, 80, 255) fontcolour(200,200,200);Radius
texteditor bounds(662, 346, 74, 19) channel("texteditor") identchannel("editorIdent8") colour:0(80, 80, 80, 255) fontcolour(200,200,200);Period
texteditor bounds(662, 366, 74, 19) channel("texteditor") identchannel("editorIdent9") colour:0(80, 80, 80, 255) fontcolour(200,200,200);Frequency
texteditor bounds(514, 358, 74, 19) channel("texteditor") identchannel("editorIdent10") colour:0(80, 80, 80, 255) fontcolour(200, 200, 200, 255);Logg
texteditor bounds(816, 318, 90, 19) channel("texteditor") identchannel("editorIdent11") colour(80, 80, 80, 255) fontcolour(200,200,200);Duration

texteditor bounds(747, 318, 69, 19) channel("texteditor") identchannel("editorIdent12") colour(80, 80, 80, 255) colour:0(80, 80, 80, 255) fontcolour(255, 255, 255, 255) text("TDuration") fontcolour:0(255, 255, 255, 255)

texteditor bounds(747, 336, 53, 19) channel("texteditor") identchannel("editorIdent13") colour(80, 80, 80, 255) colour:0(80, 80, 80, 255) fontcolour(255, 255, 255, 255) text("TDepth") fontcolour:0(255, 255, 255, 255)
texteditor bounds(797, 336, 109, 19) channel("texteditor") identchannel("editorIdent14") colour(80, 80, 80, 255) colour:0(80, 80, 80, 255) fontcolour(200, 200, 200, 255);Depth fontcolour:0(200, 200, 200, 255)

vslider bounds(12, 24, 30, 113), channel("level"), text("Level"), range(0, 2, 1, 1, 0.001) 
hslider bounds(772, 356, 122, 29) channel("Send"), text("REV"), range(0, 2, 1, 1, 0.001) 

vslider bounds(12, 142, 30, 113) channel("LpFrec"), text("LPF"), range(20, 20000, 4600, 0.5, 1) 
vslider bounds(12, 258, 30, 113) channel("HpFrec"), text("HPF")range(20, 20000, 20, 0.5, 1) 

vslider bounds(74, 316, 31, 70) channel("TLevel"), , range(0, 2, 1, 1, 0.001) 
vslider bounds(208, 316, 31, 70) channel("MetLevel"), , range(0, 2, 1, 1, 0.001) 
vslider bounds(340, 316, 31, 70) channel("RadLevel"), , range(0, 2, 1, 1, 0.001) 
vslider bounds(618, 316, 31, 70) channel("BestLevel"), , range(0, 2, 1, 1, 0.001) 
vslider bounds(470, 316, 31, 70) channel("LoggLevel"), , range(0, 2, 1, 1, 0.001) 


button bounds(118, 328, 74, 23) text("Teff") channel("Mute0") value(1) corners(4) colour:0(0, 0, 0, 70) identchannel("Mute0") fontcolour:0(164, 39, 39, 255)
button bounds(252, 328, 74, 23) text("Metallicity")  channel("Mute1") value(1) corners(4) colour:0(0, 0, 0, 70) identchannel("Mute1") fontcolour:0(164, 39, 39, 255)
button bounds(384, 328, 74, 23) text("Radius")  channel("Mute2") value(1) corners(4) colour:0(0, 0, 0, 70) identchannel("Mute2") fontcolour:0(164, 39, 39, 255)
button bounds(662, 316, 74, 23) text("TPeriod|freq", "TPeriod|freq")  channel("Mute8") value(1) corners(4) colour:0(0, 0, 0, 70) identchannel("Mute8") fontcolour:0(164, 39, 39, 255)
button bounds(514, 328, 74, 23) text("Logg", "Logg")  channel("Mute9") value(1) corners(4) colour:0(0, 0, 0, 70) identchannel("Mute9") fontcolour:0(164, 39, 39, 255)


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps =32
nchnls = 2
0dbfs = 1


gks init 0
gkplay init 0
gifrec init 0

gktrig init 0

gkTeff init 0
gkMetal init 0
gkRadius init 0
gkfP init 0

gkAmp init 0
gkDepth init 0


gkDur init 0
gkLogg init 0


#define IPADDRESS	# "localhost" #
#define PORT 		# 1337 #

instr 1

gkFader chnget "level"
gkSend chnget "Send"

gkM0 chnget "Mute0"
gkM1 chnget "Mute1"
gkM2 chnget "Mute2"
gkM8 chnget "Mute8"
gkM9 chnget "Mute9"
gkPause chnget "Pause"
giosc6 OSCinit 9996 
giosc5 OSCinit 9995 
giosc4 OSCinit 9994 
giosc3 OSCinit 9993
giosc2 OSCinit 9992
giosc1 OSCinit 9991 
giosc0 OSCinit 9990 
giosc_s OSCinit 9989


gkLpFrec chnget "LpFrec"
gkHpFrec chnget "HpFrec"

gkTLevel chnget "TLevel"
gkMetLevel chnget "MetLevel"
gkRadLevel chnget "RadLevel"
gkBestLevel chnget "BestLevel"
gkLoggLevel chnget "LoggLevel"


gkEnv linen 1, p3/16, p3, p3/1.2

    kans0 OSClisten giosc0, "/Teff", "f", gkTeff
    kans1 OSClisten giosc1, "/Metal", "f", gkMetal
    kans2 OSClisten giosc2, "/Radius", "f", gkRadius
    kans3 OSClisten giosc3, "/Logg", "f", gkLogg
    kans4 OSClisten giosc4, "/Dur", "f", gkDur
    kans5 OSClisten giosc5, "/Amp", "f", gkDepth

if gkDepth != 0 then
    kAmp = log (gkDepth/1000)
endif


kMax int 3
kMin init 0.3

gkAmp = (kAmp-kMin)/(kMax-kMin)
;-------------------------------
;Low amplitude note threshold
if gkAmp < 0.2 then
    gkAmp = kAmp
endif
;-------------------------------

    kans6 OSClisten giosc6, "/Freq", "f", gkfP

gkLpFrec chnget "LpFrec"
gkHpFrec chnget "HpFrec"


; Attack time.
  iattack = .1
  ; Decay time.
  idecay = 1
  ; Sustain level.
  isustain = .5
  ; Release time.
  irelease = 0.01
gaADSR madsr iattack, idecay, isustain, irelease


endin


instr 10


a0  oscil gkAmp/20, gkTeff/2, -1, 0

SMessage sprintfk "text(\"%i\") ", gkTeff

if gkTeff = 0.0000 then
    SMessage sprintfk "text(\"%s\") ", "-"
    chnset SMessage, "editorIdent0" 
endif

chnset SMessage, "editorIdent0" 


aHp butterhp a0, gkHpFrec
gaFilt0 moogladder aHp, gkLpFrec, 0.1
outx gaFilt0*gkEnv*gkFader*gkM0*gkTLevel*gaADSR/2, gaFilt0*gkEnv*gkFader*gkM0*gkTLevel*gaADSR/2

endin


instr 11; Metallicity

kdens expon 20000, p3, 20000

if gkMetal > 0 then
    ad dust2 gkMetal, kdens 
    a1 moogladder gkAmp*ad/2, gkMetal*(10000), 0.1
    
    SMessage1 sprintfk "text(\"%f\") ", gkMetal
    chnset SMessage1, "editorIdent1"

elseif gkMetal = 0.0000 then
    SMessage1 sprintfk "text(\"%s\") ", "-"
    chnset SMessage1, "editorIdent1"
    a1 moogladder gkAmp*ad/2, gkMetal*(10000), 0.1
   
elseif gkMetal < 0 then
    ad dust2 gkMetal*(-1), kdens 
    a1 moogladder gkAmp*ad/2, gkMetal*(-10000), 0.1
    SMessage1 sprintfk "text(\"%f\") ", gkMetal
    chnset SMessage1, "editorIdent1"
  
endif

aHp butterhp a1, gkHpFrec
gaFilt1 moogladder aHp, gkLpFrec, 0.1

outx gaFilt1*gkEnv*gkFader*gkM1*gkMetLevel*gaADSR/2, gaFilt1*gkEnv*gkFader*gkM1*gkMetLevel*gaADSR/2


endin


instr 12

kvdpth line 0, 2, 0.01
a2   fmb3 gkAmp, gkRadius*100, 0.5, 0.5, .001, 6

SMessage2 sprintfk "text(\"%f\") ", gkRadius

if gkRadius = 0.0000 then
    SMessage2 sprintfk "text(\"%s\") ", "-"
    chnset SMessage2, "editorIdent2" 
endif

chnset SMessage2, "editorIdent2"
 

aHp butterhp a2, gkHpFrec
gaFilt2 moogladder aHp, gkLpFrec, 0.1

outx gaFilt2*gkEnv*gkFader*gkM2*gkRadLevel*gaADSR/2, gaFilt2*gkEnv*gkFader*gkM2*gkRadLevel*gaADSR/2

endin


instr 18 ;Period-Freq


        if gkfP >0 then
            SMessage8 sprintfk "text(\"%f\") ", 10000/gkfP
            SMessage9 sprintfk "text(\"%i\") ", gkfP
            SMessage11 sprintfk "text(\"%f\") ", gkDur


            abell fmvoice gkAmp/2, 100*10000/gkfP, 10, 60, .5, 6

            chnset SMessage8, "editorIdent8"
            chnset SMessage9, "editorIdent9"
            chnset SMessage11, "editorIdent11"
            
        elseif gkfP == 0 then
            SMessage8 sprintfk "text(\"%f\") ", 0
            SMessage9 sprintfk "text(\"%i\") ", 0
            SMessage11 sprintfk "text(\"%f\") ", 0


            abell fmvoice gkAmp, 0, 10, 60, .5, 6
            chnset SMessage8, "editorIdent8"
            chnset SMessage9, "editorIdent9"
            chnset SMessage11, "editorIdent11"


        endif
        
  



        aHp butterhp abell, gkHpFrec
        gaFilt8 moogladder aHp, gkLpFrec, 0.1

        outx gaFilt8*gkEnv*gkFader*gkM8*gkBestLevel*gaADSR/2, gaFilt8*gkEnv*gkFader*gkM8*gkBestLevel*gaADSR/2


        
endin

instr 19

SMessage10 sprintfk "text(\"%f\") ", gkLogg

if gkLogg = 0.0000 then
    SMessage10 sprintfk "text(\"%s\") ", "-"
    chnset SMessage10, "editorIdent0" 
endif

chnset SMessage10, "editorIdent10"

SMessage14 sprintfk "text(\"%f\") ", gkDepth
chnset SMessage14, "editorIdent14"



asig buzz gkAmp/4, (gkLogg*100), 1, 1 ; clicks internal integers


  
iattack = .1
  ; Decay time.
idecay = 1
  ; Sustain level.
isustain = 1
  ; Release time.
irelease = .1
aADSR madsr iattack, idecay, isustain, irelease


aHp butterhp asig, gkHpFrec
gaFilt9 moogladder aHp, gkLpFrec, 0.1


outx gaFilt9*gkEnv*gkFader*gkM9*gkLoggLevel*gaADSR/2, gaFilt9*gkEnv*gkFader*gkM9*gkLoggLevel*gaADSR/2


endin


instr 2

kans_graph OSClisten giosc_s, "/s", "f", gks


if gks!=0 then
	
	Scurve sprintfk "file(%s)", "DVT.png"
    chnset Scurve, "Image"
    giImage imageload "DVT.png"


elseif gks==0 then
    Scurve sprintfk "file(%s)", "Init_DVT.png"
	chnset Scurve, "Image"	
	imagefree giImage
			
endif

endin




instr 6; REV OK

gasendLf= (gaFilt0*gkM0*gkTLevel+gaFilt1*gkM1*gkMetLevel+gaFilt2*gkM2*gkRadLevel+gaFilt8*gkM8*gkBestLevel+gaFilt9*gkM9*gkLoggLevel)*gkSend	
gasendRf= (gaFilt0*gkM0*gkTLevel+gaFilt1*gkM1*gkMetLevel+gaFilt2*gkM2*gkRadLevel+gaFilt8*gkM8*gkBestLevel+gaFilt9*gkM9*gkLoggLevel)*gkSend

gaRevLf, gaRevRf		reverbsc	gasendLf,gasendRf,0.85,10000

outx	gaRevLf*gkFader*gaADSR/2,gaRevRf*gkFader*gaADSR/2
		
		clear		gasendLf, gasendRf

endin


instr 1000

printk2 gkPause


   OSCsend   gkPause, $IPADDRESS, $PORT, "/pause", "f", gkPause


endin


</CsInstruments>
<CsScore>
f 1 0 1024 10 1

i 1 0 3600*24*7
i 2 0 3600*24*7


    i 10 0 3600*24*7 ;Teff-Sine
    i 11 0 3600*24*7 ;Metalicity-Noise  
    i 12 0 3600*24*7  ;Radius-Rhodes


i 18 0 3600*24*7 ; Period-Bell
i 19 0 3600*24*7; Logg

i 6 0 3600*24*7

i 1000 0 [3600*24*7]  

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
