-- ~/.config/hypr/hyprland.lua

-- Source external files
hyprland.source("~/.config/hypr/monitors.conf")

----------------
--- MONITORS ---
----------------
hyprland.monitor("", "preferred", "auto", "auto")

-------------------
--- MY PROGRAMS ---
-------------------
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "hyprlauncher"
local mainMod = "SUPER"

-----------------
--- AUTOSTART ---
-----------------
hyprland.exec_once("wayle panel start")
hyprland.exec_once("dex ~/.config/autostart/*.desktop")

----------------#############
--- ENVIRONMENT VARIABLES ---
----------------#############
hyprland.env({
    XCURSOR_SIZE = "24",
    HYPRCURSOR_SIZE = "24",
})

---------------------
--- LOOK AND FEEL ---
---------------------
hyprland.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        ["col.active_border"] = "rgba(33ccffee) rgba(00ff99ee) 45deg",
        ["col.inactive_border"] = "rgba(595959aa)",
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
        bezier = {
            { "easeOutQuint", 0.23, 1, 0.32, 1 },
            { "easeInOutCubic", 0.65, 0.05, 0.36, 1 },
            { "linear", 0, 0, 1, 1 },
            { "almostLinear", 0.5, 0.5, 0.75, 1 },
            { "quick", 0.15, 0, 0.1, 1 },
        },
        animation = {
            { "global", 1, 10, "default" },
            { "border", 1, 5.39, "easeOutQuint" },
            { "windows", 1, 4.79, "easeOutQuint" },
            { "windowsIn", 1, 4.1, "easeOutQuint", "popin 87%" },
            { "windowsOut", 1, 1.49, "linear", "popin 87%" },
            { "fadeIn", 1, 1.73, "almostLinear" },
            { "fadeOut", 1, 1.46, "almostLinear" },
            { "fade", 1, 3.03, "quick" },
            { "layers", 1, 3.81, "easeOutQuint" },
            { "layersIn", 1, 4, "easeOutQuint", "fade" },
            { "layersOut", 1, 1.5, "linear", "fade" },
            { "fadeLayersIn", 1, 1.79, "almostLinear" },
            { "fadeLayersOut", 1, 1.39, "almostLinear" },
            { "workspaces", 1, 1.94, "almostLinear", "fade" },
            { "workspacesIn", 1, 1.21, "almostLinear", "fade" },
            { "workspacesOut", 1, 1.94, "almostLinear", "fade" },
            { "zoomFactor", 1, 7, "quick" },
        },
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
    gesture = {
        { 3, "horizontal", "workspace" },
    },
    device = {
        name = "epic-mouse-v1",
        sensitivity = -0.5,
    },
})

----------------###
--- KEYBINDINGS ---
----------------###

-- Core Application Binds
hyprland.bind(mainMod, "Q", "exec", terminal)
hyprland.bind(mainMod, "C", "killactive")
hyprland.bind(mainMod, "M", "exec", "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
hyprland.bind(mainMod, "E", "exec", fileManager)
hyprland.bind(mainMod, "V", "togglefloating")
hyprland.bind(mainMod, "R", "exec", menu)
hyprland.bind(mainMod, "P", "pseudo")
hyprland.bind(mainMod, "D", "exec", "hyprlauncher")

-- Focus Navigation
hyprland.bind(mainMod, "left", "movefocus", "l")
hyprland.bind(mainMod, "right", "movefocus", "r")
hyprland.bind(mainMod, "up", "movefocus", "u")
hyprland.bind(mainMod, "down", "movefocus", "d")

-- Workspace Switching
for i = 1, 9 do
    hyprland.bind(mainMod, tostring(i), "workspace", tostring(i))
    hyprland.bind(mainMod .. " SHIFT", tostring(i), "movetoworkspace", tostring(i))
end
hyprland.bind(mainMod, "0", "workspace", "10")
hyprland.bind(mainMod .. " SHIFT", "0", "movetoworkspace", "10")

-- Special Workspace (Scratchpad)
hyprland.bind(mainMod, "S", "togglespecialworkspace", "magic")
hyprland.bind(mainMod .. " SHIFT", "S", "movetoworkspace", "special:magic")

-- Mouse Binds
hyprland.bind(mainMod, "mouse_down", "workspace", "e+1")
hyprland.bind(mainMod, "mouse_up", "workspace", "e-1")
hyprland.bindm(mainMod, "mouse:272", "movewindow")
hyprland.bindm(mainMod, "mouse:273", "resizewindow")

-- Media & Hardware Keys (bindel / bindl)
hyprland.bindel("", "XF86AudioRaiseVolume", "exec", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
hyprland.bindel("", "XF86AudioLowerVolume", "exec", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
hyprland.bindel("", "XF86AudioMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
hyprland.bindel("", "XF86AudioMicMute", "exec", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
hyprland.bindel("", "XF86MonBrightnessUp", "exec", "brightnessctl -e4 -n2 set 5%+")
hyprland.bindel("", "XF86MonBrightnessDown", "exec", "brightnessctl -e4 -n2 set 5%-")

hyprland.bindl("", "XF86AudioNext", "exec", "playerctl next")
hyprland.bindl("", "XF86AudioPause", "exec", "playerctl play-pause")
hyprland.bindl("", "XF86AudioPlay", "exec", "playerctl play-pause")
hyprland.bindl("", "XF86AudioPrev", "exec", "playerctl previous")

----------------##############
--- WINDOWS AND WORKSPACES ---
----------------##############
hyprland.windowrule({
    name = "suppress-maximize-events",
    ["match:class"] = ".*",
    suppress_event = "maximize",
})

hyprland.windowrule({
    name = "fix-xwayland-drags",
    ["match:class"] = "^$",
    ["match:title"] = "^$",
    ["match:xwayland"] = true,
    ["match:float"] = true,
    ["match:fullscreen"] = false,
    ["match:pin"] = false,
    no_focus = true,
})

hyprland.windowrule({
    name = "move-hyprland-run",
    ["match:class"] = "hyprland-run",
    move = "20 monitor_h-120",
    float = true,
})