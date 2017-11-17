#vim: set ft=dosini
# =====================================================
#
#   To learn more about how to configure Polybar
#   go to https://github.com/jaagr/polybar
#
#   The README contains alot of information
#
# =====================================================
# https://www.w3schools.com/colors/colors_picker.asp
[colors]
#{{{
#background = ${xrdb:URxvt.background:#ffffff}
background = #ff000000
background-alt = #444
foreground = #dfdfdf
foreground-alt = #55
primary = #00cccc
secondary = #e60053
alert = #bd2c40
green = #0f0
#}}}

[global/wm]
#{{{
margin-top = 10
margin-bottom = 0
#}}}

[bar/eriksbar2]
#{{{
monitor = HDMI-2
width = 100%
height = 27
offset-x = 0%
offset-y = 0
bottom = false
radius = 6.0

tray-position = right
tray-padding = 2
tray-transparent = false
tray-background = ${colors.background}

background = ${colors.background}
foreground = ${colors.foreground}

overline-size = 2
overline-color = ${colors.foreground}
underline-size = 2
underline-color = ${colors.background}

border-bottom-size = 3
border-bottom-color = ${colors.background}
padding-left = 1
padding-right = 3
module-margin-left = 2
module-margin-right = 2

font-0 = Dejavu Sans Mono Nerd font:pixelsize=14;2
font-1 = Dejavu Sans Mono for Powerline:pixelsize=14;2
font-2 = FontAwesome:size=16;3

modules-left = i3 memory cpu battery temperature 
modules-center = xwindow
modules-right = backlight volume date

wm-restack = i3
override-redirect = false

scroll-up = i3wm-wsnext
scroll-down = i3wm-wsprev
#}}}

[module/xwindow]
#{{{
type = internal/xwindow
label = %title%
transparent = true
background = ${colors.background}
;label = %title:0:15:...%
#}}}

[module/i3]
#{{{
type = internal/i3
pin-workspaces = true
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false
enable-click = true

label-mode-padding = 2
label-mode-foreground = #000
label-mode-background = ${colors.primary}

label-focused = %index%
label-focused-background = ${colors.background-alt}
label-focused-underline= ${colors.primary}
label-focused-padding = 2

label-occupied = %index%
label-occupied-padding = 2

label-unfocused = %index%
label-unfocused-padding = ${self.label-occupied-padding}

label-urgent = %index%!
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

label-visible = %index%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}
#}}}

[module/mpd]
#{{{
#type = internal/mpd
; format-online = <label-song>  <icon-prev> <icon-seekb> <icon-stop> <toggle> <icon-seekf> <icon-next>  <icon-repeat> <icon-random>
; label-song-maxlen = 25
; label-song-ellipsis = true
; icon-prev = 
; icon-seekb = 
; icon-stop = 
; icon-play = 
; icon-pause = 
; icon-next = 
; icon-seekf = 
; icon-random = 
; icon-repeat = 
; toggle-on-foreground = ${colors.primary}
; toggle-off-foreground = #66
#}}}

[module/backlight] 
#{{{
type = internal/backlight
card = intel_backlight
format = <label> <bar>
label=" "
bar-width = 10
bar-indicator = │
bar-indicator-foreground = #ff
bar-indicator-font = 2
bar-fill = ─
bar-fill-font = 2
bar-fill-foreground = #9f78e1
bar-fill-background = ${colors.background}
bar-empty = ─
bar-empty-font = 2
bar-empty-foreground = ${colors.foreground-alt}
#}}}

[module/cpu]
#{{{
type = internal/cpu
interval = 2
format-prefix-foreground = ${colors.foreground-alt}
label =  : %percentage%%
#}}}

[module/memory]
#{{{
type = internal/memory
interval = 2
format-prefix = 
format-prefix-foreground = ${colors.foreground-alt}
label = Mem: %percentage_used%%
#}}}

[module/wlan]
#{{{
type = internal/network
interface = wlp2s0 
interval = 3.0
format-connected = <ramp-signal> <label-connected>
format-connected-underline = #9f78e1
format-disconnected-underline = ${self.format-connected-underline}
label-connected = %essid%
label-disconnected = %ifname% disconnected
label-disconnected-foreground = ${colors.foreground-alt}
ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 
ramp-signal-foreground = ${colors.foreground-alt}
#}}}

[module/eth]
#{{{
type = internal/network
interface = lo
interval = 3.0
format-connected-underline = #55aa55
format-connected-prefix = " "
format-connected-foreground-foreground = ${colors.foreground-alt}
label-connected = IP: %local_ip%
format-disconnected-underline = ${self.format-connected-underline}
label-disconnected = %ifname% disconnected
label-disconnected-foreground = ${colors.foreground-alt}
#}}}

[module/date]
#{{{
type = internal/date
interval = 5
date = "  %d/%m/%y"
date-alt = " %d"
time = "   %H:%M"
time-alt =  %H:%M
format-prefix-foreground = ${colors.foreground-alt}
label = %date% %time%
#}}}

[module/volume]
#{{{
type = internal/volume
format-volume = <label-volume> <bar-volume>
label-volume = ""
label-volume-font = 15
label-volume-foreground = ${root.foreground}
format-muted-prefix = " "
format-muted-foreground = ${colors.foreground-alt}
label-muted = sound muted
bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = │
bar-volume-indicator-font = 3
bar-volume-indicator-foreground = #ff
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}
interval = 0.05
click-middle = pactl set-sink-mute 0 toggle
scroll-up = pactl set-sink-volume 0 +5%
scroll-down = pactl set-sink-volume 0 -5%
#}}}

[module/battery]
#{{{
type = internal/battery
battery = BAT0
adapter = ADP1
full-at = 98
format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>

format-full-prefix = " "
format-full-prefix-foreground = ${colors.foreground}

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 
ramp-capacity-foreground = ${colors.foreground}

animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
animation-charging-foreground = ${colors.foreground-alt}
animation-charging-framerate = 750
#}}}

[module/temperature]
#{{{
type = internal/temperature
thermal-zone = 0
warn-temperature = 60
format = <label>
format-warn = <label-warn>
label =   %temperature%
label-warn = %temperature%
label-warn-foreground = ${colors.secondary}
#}}}

[module/powermenu]
#{{{
type = custom/menu
format-spacing = 1
label-open = power
label-open-foreground = ${colors.secondary}
label-close = cancel
label-close-foreground = ${colors.secondary}
label-separator = |
label-separator-foreground = ${colors.green}

menu-0-0 = reboot
menu-0-0-exec = menu-open-1
menu-0-1 = power off
menu-0-1-exec = menu-open-2

menu-1-0 = cancel
menu-1-0-exec = menu-open-0
menu-1-1 = reboot
menu-1-1-exec = sudo reboot

menu-2-0 = power off
menu-2-0-exec = sudo poweroff
menu-2-1 = cancel
menu-2-1-exec = menu-open-0
#}}}

# vim:fdm=marker
