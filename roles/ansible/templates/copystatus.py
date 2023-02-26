import re 
import json
import sys

LOG_FILE = sys.argv[1]
OUT_FILE = sys.argv[2]

MATCH    = r"([a-zA-Z0-9]*)\.askmartyn\s*:\sok=([0-9]*)\s*changed=([0-9]*)\s*unreachable=([0-9]*)\s*failed=([0-9]*)\s*skipped=([0-9]*)\s*rescued=([0-9]*)\s*ignored=([0-9]*)\s*"


STATUS = {}
with open(LOG_FILE) as log_file:
   for line in log_file.readlines():
      match = re.search(MATCH, line) 
      if match:
         STATUS[match.group(1)] = [
       { "ok": match.group(2)},
       { "ch": match.group(3)},
       { "un": match.group(4)},
       { "fa": match.group(5)},
       { "sk": match.group(6)},
       { "re": match.group(7)},
       { "ig": match.group(8)}
         ]
      
with open(OUT_FILE, 'w') as out_file:
   out_file.write(json.dumps(STATUS))
