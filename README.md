# S&T documentation

To run a test version, run the following commands:

```
python -m venv .venv
.venv/scripts/activate
pip install -r requirements.txt
mkdocs build
mkdocs serve -a 127.0.0.1:8888
```

The site will then be available at http://127.0.0.1:8888/

## To rebuild signalling system documentation
- Make sure this folder exists alongside SignallingSystem in its parent directory
- Install doxygen and doxybook2
- make sure you are in the python virtual environment
- run `build.ps1`