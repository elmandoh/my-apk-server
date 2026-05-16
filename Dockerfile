FROM budtmo/docker-android:emulator_9.0

ENV EMULATOR_ARGS="-no-window -no-audio -no-boot-anim"
ENV DEVICE_RES="480x320"
ENV VNC_COLOUR_DEPTH=8
ENV WEBRTC=false

EXPOSE 6080

RUN apt-get update && apt-get install -y wget && \
    wget -O /root/myapp.apk https://apk.e-droid.net/apk/app4036165-vkb9oi.apk?v=1

CMD ["/bin/bash", "-c", "socat TCP-LISTEN:6080,fork TCP:127.0.0.1:6080 & sleep 15 && adb install /root/myapp.apk & /home/androiduser/starter.sh"]
