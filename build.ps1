rm -force -recurse docs/mainsystem
rm -force -recurse docs/audiosystem

doxygen Doxyfile-mainsystem.windows
mkdir ./docs/mainsystem
doxybook2 --input ./doxyoutput-mainsystem/xml --output ./docs/mainsystem --config config-doxybook2-mainsystem.json

doxygen Doxyfile-audiosystem
mkdir ./docs/audiosystem
doxybook2 --input ./doxyoutput-audiosystem/xml --output ./docs/audiosystem --config config-doxybook2-audiosystem.json


mkdocs build --clean --site-dir _build/html --config-file mkdocs.yml

rm -force -recurse doxyoutput-mainsystem
rm -force -recurse doxyoutput-audiosystem