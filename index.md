# Instructions
This is a NeoVim guide for Windows users to install somewhat "automatically" everything you need to make your NeoVim look like VSCode.<br>

1 - First you have to install NeoVim, NodeJS, Git and Python!<br>

2 - Add NeoVim to NodeJS globals (Use Command Prompt)<br>
```npm install -g neovim```<br>

3 - Add NeoVim module to Python (Use Command Prompt)<br>
```python -m pip install --user --upgrade pynvim```<br>

4 - Install Jedi Language Server (Use Command Prompt)<br>
```python -m pip install jedi-language-server```<br>

5 - Download and Run the file ["RemapEscToCapslock.reg"](https://github.com/louiscavalcante/neovimWindows/blob/main/RemapEscToCapslock.reg) from the repo.<br>

6 - Configuring Icons to Command Prompt (CMD) and PowerShell:
- Download and Install the Font ["Fantasque Sans Mono"](https://github.com/louiscavalcante/neovimWindows/raw/main/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Windows%20Compatible.ttf) from the repo;
- Download and Run the file ["fontFixTerminal.reg"](https://github.com/louiscavalcante/neovimWindows/blob/main/fontFixTerminal.reg) from the repo;
- Restart your computer;
- Open the PowerShell, right click the Title Bar > Defaults > Font > select the Font "Fantasque Sans Mono" from the list;
- Open the Command Prompt (CMD), right click the Title Bar > Defaults > Font > select the Font "Fantasque Sans Mono" from the list.

7 - Download and Run the file ["nvimAutomation.bat"](https://github.com/louiscavalcante/neovimWindows/blob/main/nvimAutomation.bat) from the repo.<br>

8 - Wait until all Plugins and Coc Extensions downloads are done so you can close NeoVim.

9 - Open Command Prompt (CMD) or PowerShell, type ```nvim``` and hit Enter, now enjoy your fully configured NeoVim!<br>

10 - Creating a NeoVim shortcut (Optional):
- Create a shorcut from the ```nvim.exe``` file
- Right click on the shortcut and go to properties;
- Inside the shortcut properties change the option Run: from "Normal Window" to "Maximized";
- Inside the shortcut properties also "Change the Icon..." and select the nvim-qt.exe Icon;
- Move the shortcut to the path as specified below...
- %UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
- Open the Start Menu and search for nvim's shortcut inside the programs list;
- Right click on nvim's shortcut and select "Pin to Start".<br>

# Usage
### <b>Custom shortcuts added to your NeoVim:</b>
```
CTRL+\          > Opens / Closes NERDTree
CTRL+p          > Searches any file in your project's directory like in VSCode's CTRL+P
CAPSLOCK        > Works like ESC, so it's closer to your "home" keys
SPACEBAR        > Folds / Unfolds your code under your cursor line
CTRL+TAB        > Goes to the next buffer
CTRL+SHIFT+TAB  > Goes to the previous buffer
CTRL+x          > Closes the current buffer if saved (only works if another buffer is open)
CTRL+z          > Opens Startify
cc              > Comment / Uncomment the line under your cursor
CTRL+j          > Next line of code error
CTRL+k          > Previous line of code error
CTRL+w+w        > Changes your NeoVim cursor from one buffer to another
K               > Gives a help screen about the content under the cursor (like intelliSense quick info)
gd              > Goes to definition of the content under the cursor
F2              > Renames every usable instance of the word under the cursor
```
### <b>Vim Command Tips:</b>
```
:! dir                                  > Runs a dir command on command prompt (CMD) through Vim
:! node fileName.js                     > Runs node command on command prompt (CMD) through Vim
:! npm start                            > Runs npm command on command prompt (CMD) through Vim
:w                                      > Save / Writes the current buffer changes to the current file
:Git add *                              > Add all files to git through Vim
:Git commit -m "your message here" *    > Commit all changes to git through Vim
:Git push -u origin main                > Push changes to a git branch called "main" through Vim
:Git push                               > Push changes to the default branch through Vim
:saveas C:\\test.js                     > Save the current buffer as test.js inside the C:\\ folder
```
### <b>Eslint Configuration:</b><br>
- To make your eslint work, you'll need to open a Command Prompt (CMD) and navigate to your Project's root folder.
- Now type ```eslint --init``` and it will install all node_modules dependencies accordingly to your needs.

# Live Server with Neovim
Installs Live Server globally. You'll only need to do it once (Use Command Prompt)<br>
```npm i -g live-server```<br>
Runs Live Server and look for changes in the current directory (Use Command Prompt)<br>
```live-server .\```<br>
Your Page will be hosted at<br>
```http://127.0.0.1:8080```<br>
Stop hosting<br>
```CTRL+c```<br>
