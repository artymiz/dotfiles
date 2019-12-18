# Some useful Git Commands

### Changing the origin of Git repository
``` {r, engine='sh', count_lines}
git remote rm origin
git remote add origin git@github.com:aplikacjainfo/proj1.git
git config master.remote origin
git config master.merge refs/heads/master
```
