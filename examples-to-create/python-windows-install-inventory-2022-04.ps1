@'

[1] enumerate python installs
    py --list-paths
    gcm python*

[2]
    enumerate their global env using
    thatpython -m pip list
[3]
    enumerate venvs get
    find 'venv/**/*.python'
        thatpy -m -pip list
'@
| Write-Warning
