# docker-sikuli-novnc
Dockerfile for ubuntu + lxde + x11vnc + chrome + sikuli + novnc

From Docker Index
```
docker pull kkochubey1/sikuli-novnc
```

Build yourself
```
git clone https://github.com/kkochubey1/docker-sikuli-novnc.git
docker build --rm -t kkochubey1/sikuli-novnc docker-sikuli-novnc
```

Run
```
docker run -i -t -p 6080:6080 kkochubey1/sikuli-novnc
```

Browse http://<docker-machine ip ...>:6080/vnc.html

<img src="https://raw.github.com/fcwu/docker-ubuntu-vnc-desktop/master/screenshots/lxde.png" width=400/>


Test
```
# Test sikuli edit script
./test/sikuli-edit.sh test/test.sikuli

# Test sikuli run script
./test/sikuli-run.sh test/test.sikuli
```


License
==================

desktop-mirror is under the Apache 2.0 license. See the LICENSE file for details.