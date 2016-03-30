
#!/bin/bash

cd ~/workspace/python/green

cd green_core && hg pull && hg update

cd ..

cd green_operator && hg pull && hg update

cd ..

cd green_admin && hg pull && hg update

cd ..

cd green_paysite && hg pull && hg update
