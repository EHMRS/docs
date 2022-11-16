rm -force -recurse docs/vb
mkdir docs/vb

doxygen Doxyfile.windows
doxybook2 --input ./doxyoutput/xml --output ./docs/vb --config config-doxybook2.json
mkdocs build --clean --site-dir _build/html --config-file mkdocs.yml

rm -force -recurse doxyoutput