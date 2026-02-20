Dependencies:
* hyprland
* quickshell
* adw-gtk-theme
* matugen

Manual steps: <br>
Add at the top of `~/.config/gtk-3.0/gtk.css` and `~/.config/gtk-4.0/gtk.css` (requires sudo)
```css
@import 'colors.css';
```

Add to `~/.config/Kvantum/kvantum.kvconfig`
```
[General]
theme=matugen
```

Add to `~/.config/spicetify/config-xpui.ini` (have Sleek theme installed)
```
color_scheme = matugen
current_theme = Sleek
```


Shell inspired by [illogical-impulse](https://github.com/end-4/dots-hyprland) and [caelestia-shell](https://github.com/caelestia-dots/shell)
