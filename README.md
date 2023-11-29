# DVT-Explorer
Sonification of star and planet variables from the Transiting Exoplanet Survey Satellite (TESS) stored in Data Validation Time-series (DVT) files. Data: STScI.
![TESS-GitHub](https://github.com/AuditoryVO/DVT-Explorer/assets/144262864/f372a69e-33ba-4f69-944b-26b5a6ad530d)

CONTENTS

- DVT Explorer folder
  - Jupyter notebook: DVT_Explorer-TESS_sector1.ipynb
  - CSound/Cabbage file: DVT_Explorer.csd
  - Cabbage mask files: init_DVT.png and init_plot.png
  - Image samples: DVT.png and plot.png
- Single DVT + Aladin folder
  - Jupyter notebook: Single_DVT_Aladin.ipynb
  - CSound/Cabbage file: Single_DVT_Aladin.csd
  - Cabbage mask file: init_DVT.png
  - Image sample: DVT.png
- LICENSE
- README
- requirements.txt

CABBAGE/CSOUND INSTALLATION

1- Download and install CSound 6.15 from: https://github.com/csound/csound/releases/tag/6.15.0

2- Download Cabbage from: https://cabbageaudio.com/download/ 

3- Install only Cabbage from the downloaded Cabbage package.

   Warning: The latest version of Cabbage allows to optionally install the latest version of CSound. This default option should be unchecked not to overwrite CSound 6.15.
   Latests versions of CSound require additional plugins to work with the image CSound opcodes, so they should not be used.


DVT-EXPLORER INSTALLATION

1- Download the data from: https://archive.stsci.edu/missions/tess/tid/

2- Download all the content of this repository into the same folder

3- Install all the dependencies included in the requirements.txt file

4- To reproduce the sonifications:
   - Launch Cabbage, open DVT_Explorer.csd, and press play
   - Run the Jupyter notebook (DVT_Explorer-TESS_sector1.ipynb)
   - Add your path to the downloaded files before running all the cells

Enjoy the sonifications!
