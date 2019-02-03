# -*- coding: utf-8 -*-
# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

try:
    from typing import List  # noqa: F401
except ImportError:
    pass

mod  = "mod4"
alt  = "mod1"
ctrl = "control"
terminal = "st"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),

    # Switch window focus to other pane(s) of stack
    Key([alt], "Tab", lazy.layout.next()),
    Key([alt, "shift"], "Tab", lazy.layout.previous()),
    Key([ctrl, alt], "space", lazy.widget['keyboardlayout'].next_keyboard()),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout()),

    Key([alt], "F4", lazy.window.kill()),
    Key([ctrl, alt], "w", lazy.window.kill()),

    Key([mod, ctrl], "r", lazy.restart()),
    Key([mod, ctrl], "q", lazy.shutdown()),

    # Launch things
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod, ctrl], "Return", lazy.spawn("urxvtc +sb")),
    Key([mod], "r", lazy.spawn("rofi -show run")),
    Key([mod], "w", lazy.spawn("firefox")),
    Key([mod], "c", lazy.spawn("urxvtc -fn 'xft:Hack:size=40:antialias=true' +sb -e peaclock")),
    Key([mod], "h", lazy.spawn(terminal + " -e htop")),

    Key([ctrl, alt], "Left", lazy.screen.prev_group()),
    Key([ctrl, alt], "Right", lazy.screen.next_group()),

    Key([alt, ctrl], "c",
        lazy.spawn(terminal + " -e vim /home/jacob/.config/qtile/config.py")),
]

# TODO: Fix the names of the groups
# groups = [
#     Group("DEV", layout="max"),
#     Group("WEB", layout="max"),
#     Group("SYS", layout="monadtall"),
#     Group("DOC", layout="monadtall"),
#     Group("CHAT", layout="monadtall"),
#     Group("GFX", layout="floating"),
#     ]

# groups = [Group(name, **kwargs) for name, kwargs in init_group_names()]

groups = [Group(i) for i in "1234"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

# Use layout theme when initialising the layouts
layout_theme = {
        "border_width": 2,
        "margin": 5,
        "border_focus": "009B96",
        "border_normal": "1D2330"
        }

layouts = [
    layout.Max(**layout_theme),
    layout.xmonad.MonadTall(**layout_theme),
]


widget_defaults = dict(
    font='sanf-serif',
    fontsize=14,
    padding=3,
)

extension_defaults = widget_defaults.copy()

keyboardWidget = widget.KeyboardLayout(configured_keyboards=['us', 'se'])

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                # widget.Spacer(),
                widget.Systray(),
                widget.Net(interface='wlo1'),
                widget.Battery(
                    energy_now_file='charge_now',
                    energy_full_file='charge_full',
                    power_now_file='current_now',
                    update_delay = 30,
                    foreground = "7070ff",
                    ),
                widget.CurrentLayout(),
                # widget.KeyboardLayout(configured_keyboards=['us', 'se']),
                keyboardWidget,
                widget.Clock(format='%H:%M'),
            ],
            28,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])
