# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("pulseaudio",
    format="♪{volume}",)

status.register("clock",
    format="%a %-d %b %X KW%V",)

# Displays whether a DHCP client is running
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhclient*.pid",)

status.register("network",
    interface="em1",
    format_up="{v4cidr}",)

status.register("disk",
    path="/",
    format="root: {used}/{total}G [{avail}G]",)

# status.register("disk",
#     path="/home",
#     format="home: {used}/{total}G [{avail}G]",)
status.register("mem")
status.register("mem_bar")

status.register("cpu_usage")
status.register("load")
# status.register("temp",
#     format="{temp:.0f}°C",
#     file="/sys/devices/platform/coretemp.0/temp2_input")
# status.register("temp",
#     format="{temp:.0f}°C",
#     file="/sys/devices/platform/coretemp.0/temp3_input")
# status.register("temp",
#     format="{temp:.0f}°C",
#     file="/sys/devices/platform/coretemp.0/temp4_input")
# status.register("temp",
#     format="{temp:.0f}°C",
#     file="/sys/devices/platform/coretemp.0/temp5_input")
status.register("cpu_usage_graph")

status.run()
