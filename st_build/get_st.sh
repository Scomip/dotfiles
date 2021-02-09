#!/usr/bin/env sh

# sudo apt-get install -y libx11-dev libxft-dev
# git clone https://git.suckless.org/st
# make -C st

git -C st clean -f
git -C st checkout .

for patch_url in \
    https://st.suckless.org/patches/anysize/st-anysize-0.8.1.diff \
    https://st.suckless.org/patches/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff \
    https://st.suckless.org/patches/boxdraw/st-boxdraw_v2-0.8.3.diff \
    https://st.suckless.org/patches/font2/st-font2-20190416-ba72400.diff \
    https://st.suckless.org/patches/right_click_to_plumb/plumb_without_shell_OSC.diff \
    https://st.suckless.org/patches/scrollback/st-scrollback-20200419-72e3f6c.diff \
    https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff \
    https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20200416-5703aa0.diff \
    https://st.suckless.org/patches/sync/st-appsync-20200618-b27a383.diff
do
    echo $patch_url
    curl $patch_url | patch -d st -p1
done

cp st/config.def.h st/config.h
patch st/config.h config.diff

make -C st
