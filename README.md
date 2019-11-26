Python VENV Example
===================

Install `virtualenv`.
```
python install -U pip virtualenv
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

Deactivate the environment by executing `deactivate`.

## Python Versions and VirtualEnv

The embedded package for Python will not work with `virtualenv`. WinPython provides a nice standalone packaging of Python: their Win64 Zero release.
The `download-python.ps1` scripts downloads WinPython Zero 3.7.5.

## `virtualenv` vs. `python -m venv`

Invoking the `venv` module through python does not allow for custom versions of Python to be used.
Only `virtualenv` can create environment that use versions of Python outside of the system version.
