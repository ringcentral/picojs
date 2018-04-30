#
#
wget https://github.com/nenadmarkus/pico/raw/346881039e5d1f5abe64733a49886bdfd5ab2d51/rnt/picornt.c
wget https://github.com/nenadmarkus/pico/raw/346881039e5d1f5abe64733a49886bdfd5ab2d51/rnt/cascades/facefinder
#
#
cat facefinder | hexdump -v -e '16/1 "0x%x," "\n"' > facefinder.hex
#
# you need to `source ./emsdk_env.sh` befor executing the following line
emcc main.c -o wasmpico.js -O3 -s EXPORTED_FUNCTIONS="['_find_faces', '_cluster_detections', '_malloc', '_free']" -s WASM=1
#
#
rm facefinder
rm facefinder.hex
rm picornt.c
