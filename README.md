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

## Auto build and deploy
There is a github action that will automatically deploy the documentation to
github pages. In order for it to pick up all documentation of programs, it is 
required to add each of the repos into the `doxybooks.json` file.

The format is as follows:

```json
{
  "folder": "mainsystem",
  "doxyfile": "Doxyfile-mainsystem.linux",
  "repo": "SignallingSystem"
},
```

Where:

- folder is the folder within the generated docs that will contain the files
- doxyfile is the Doxyfile used to generate the Doxygen documentation
- repo is the repoistory (under EHMRS) that contains the code needing documenting