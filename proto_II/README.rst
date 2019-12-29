###################################
Happy Snail TH-Sensor: Prototype II
###################################

*********************
Generating proper BOM
*********************

#. Install `KiBOM`_ tool. Instructions below assume that it was installed under ``~/project/KiBoM``
   directory.

#. Install `Interactive BOM tool`_. Instructions below assume that it was installed under
   ``~/projects/InteractiveHtmlBom/`` directory.

#. Generate `proto_II_assembly.xml` file by exporting any BOM from the KiCAD eeschema. This intermediate
   file is required for futher processing and there is no way to generate it without generating
   default KiCAD BOM.

#. Run from within ``proto_II_kicad/assembly`` directory::

     # Generic variant
     ~/projects/KiBoM/KiBOM_CLI.py ./proto_II_assembly.xml ./bom.csv

     # Only 5V, non-isolated RS485 variant
     ~/projects/KiBoM/KiBOM_CLI.py -r noiso_5v ./proto_II_assembly.xml ./bom.csv

     # Better 12V-24V, isolated RS485 variant
     ~/projects/KiBoM/KiBOM_CLI.py -r iso_12_24v ./proto_II_assembly.xml ./bom.csv

#. Generate BOM for importing into PartsBox::

     python ../../../scripts/process_bom.py ./bom.csv ./partsbox_bom.csv

#. Run from within ``proto_II_kicad/assembly`` directory to generate interactive BOM::

     python ~/projects/InteractiveHtmlBom/InteractiveHtmlBom/generate_interactive_bom.py \
       ./proto_II_assembly.kicad_pcb   \
       --netlist-file ./proto_II_assembly.xml \
       --extra-fields "MPN"

.. _`KiBOM`: https://github.com/SchrodingersGat/KiBoM
.. _`Interactive BOM tool`: https://github.com/openscopeproject/InteractiveHtmlBom
