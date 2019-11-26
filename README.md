Python Virtualenv Example
=========================

**You must have 7-zip installed, and `7z` on your path**

This is a minimal project example that uses Python in a Virtualenv to install
TensorFlow from a `requirements.txt` file.

To create the project Virtualenv, run `create-venv.ps1`.

```
PS > .\create-venv.ps1
```

This script will install Virtualenv, a portable Python in the project directory
under `third_party/` and create a a venv using this version of Python (3.7).

Instructions are provided on-screen to install TensorFlow:
```
. .\.venv\Scripts\activate
pip install -r requirements.txt
```

## Detailed Steps

Install `virtualenv`.
```
pip install -U pip virtualenv
```

Download a portable version of Python.

```
.\download-python.ps1
```

Create a `venv` using `virtualenv`.

```
python -m virtualenv --python=third_party\WPy64-3741\python-3.7.4.amd64\python.exe
```

Activate the `venv` environment.
```
. .\venv\Scripts\activate. 
```

Install `requirements.txt`
```
pip install -r requirements.txt
```

Deactivate the environment by executing `deactivate`.

## Python Versions and VirtualEnv

The embedded package for Python will not work with `virtualenv`. WinPython provides a nice standalone packaging of Python: their Win64 Zero release.
The `download-python.ps1` scripts downloads WinPython Zero 3.7.5.

## `virtualenv` vs. `python -m venv`

Invoking the `venv` module through python does not allow for custom versions of Python to be used.
Only `virtualenv` can create environment that use versions of Python outside of the system version.
