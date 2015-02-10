# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("pulseaudio",
    format="♪{volume}",)

status.register("clock",
    format="%a %-d %b %X KW%V",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# status.register("battery",
#     format="{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
#     alert=True,
#     alert_percentage=5,
#     status={
#         "DIS": "↓",
#         "CHR": "↑",
#         "FULL": "=",
#     },)

# This would look like this:
# Discharging 6h:51m
# status.register("battery",
#     format="{status} {remaining:%E%hh:%Mm}",
#     alert=True,
#     alert_percentage=5,
#     status={
#         "DIS":  "Discharging",
#         "CHR":  "Charging",
#         "FULL": "Bat full",
#     },)

# Displays whether a DHCP client is running
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="eth0",
    format_up="{v4cidr}",)

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
#
# Note: requires both netifaces and basiciw
# status.register("wireless",
#     interface="wlan0",
#     format_up="{essid} {quality:03.0f}%",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format="root: {used}/{total}G [{avail}G]",)

status.register("disk",
    path="/home",
    format="home: {used}/{total}G [{avail}G]",)

status.register("mem")
status.register("mem_bar")

status.register("cpu_usage")
status.register("load")
status.register("temp",
    format="{temp:.0f}°C",
    file="/sys/devices/platform/coretemp.0/temp2_input")
status.register("temp",
    format="{temp:.0f}°C",
    file="/sys/devices/platform/coretemp.0/temp3_input")
status.register("temp",
    format="{temp:.0f}°C",
    file="/sys/devices/platform/coretemp.0/temp4_input")
status.register("temp",
    format="{temp:.0f}°C",
    file="/sys/devices/platform/coretemp.0/temp5_input")
status.register("cpu_usage_graph")

status.run()
