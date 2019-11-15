###################################
Happy Snail TH-Sensor: Prototype II
###################################

*********************
Generating proper BOM
*********************

#. Install `KiBOM`_ tool

#. Run from within ``proto_II_kicad/assembly`` directory::

   # Generic variant
   ~/projects/KiBoM/KiBOM_CLI.py ./proto_II_assembly.xml ./bom.csv

   # Only 5V, non-isolated RS485 variant
   ~/projects/KiBoM/KiBOM_CLI.py -r noiso_5v ./proto_II_assembly.xml ./bom.csv

   # Better 12V-24V, isolated RS485 variant
   ~/projects/KiBoM/KiBOM_CLI.py -r iso_12_24v ./proto_II_assembly.xml ./bom.csv

#. Generate BOM for importing into PartsBox::

   python ../../../scripts/process_bom.py ./bom.csv ./partsbox_bom.csv


.. _`KiBOM`: https://github.com/SchrodingersGat/KiBoM
