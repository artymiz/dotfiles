# references
A list of useful Ubuntu/Linux commands for myself to remember

### Some useful Git Commands

#### Changing the origin of Git repository
```console
git remote rm origin
git remote add origin git@github.com:aplikacjainfo/proj1.git
git config master.remote origin
git config master.merge refs/heads/master
```
### Refer to this for changing file permissions in ubuntu
https://help.ubuntu.com/community/FilePermissions

### Ghostscript
*Ghostscript* is useful for pdf compressions <br />
**Usage Example:** <br />
`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed.pdf original.pdf` <br />
[doc](https://www.ghostscript.com/doc/9.26/Readme.htm)
