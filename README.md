[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
# dotfiles
this is my personal config in debian 12. 
requirements:
`git`, `gnu-stow`.

## usage
first install gnu-stow, on debian based distro:
```bash
sudo apt install stow
```
```bash
git clone https://github.com/fauzymadani/dotfiles.git
```
```bash
cd dotfiles
stow i3 #example
```
> [!WARNING]
> Critical content demanding immediate user attention due to potential risks.

the nvchad config in this repository is deprecated and no longer updated, see 
<a href="https://github.com/fauzymadani/nvchad-config">here</a> instead.

<hr>

> [!IMPORTANT]  
> ## Crucial information necessary for nvim-nvchad configuration
special for this configuration, i'm not creating symlink with stow. `i'm too lazy for moving my config for stow`. so when you're facing an error when trying to use this configuration with stow, it means you have to move the configuration files yourself.
```bash
mv ~/dotfiles/nvim-nvchad/* ~/.config/nvim/
```

> [!IMPORTANT]  
if you struggled for finding app class for exclude in picom.conf for example, try:
```bash
xprop | grep WM_CLASS
#and then select the app
```
example output:
```bash
[ fauzy@debian ]: ~ $ xprop | grep WM_CLASS
WM_CLASS(STRING) = "Navigator", "firefox-esr"
```
and then put the `WM_CLASS` in the picom.conf for example:
```conf
opacity-rule = [
    "90:class_g = 'Google-chrome'",
    "90:class_g = 'firefox-esr'",
    "90:class_g = 'Navigator'"
];
```

## Activity
![Alt](https://repobeats.axiom.co/api/embed/5ba5f29cccfc8a53d092ff53efe89d020c42fc97.svg "Repobeats analytics image")
