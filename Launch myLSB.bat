cd C:\Games\FFXI\xiLSB
start xi_connect.exe
start xi_search.exe
start xi_map.exe
SLEEP 5
call C:\ProgramData\Anaconda3\Scripts\activate.bat pydarkstar
cd C:\Games\FFXI\xiLSB\pydarkstar_topaz\bin
.\broker.py
PAUSE
conda deactivate
cd C:\Games\FFXI\xiLSB\tools
py -3 dbtool.py backup
SLEEP 10
