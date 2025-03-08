Formulae Caveats Shortcut for Homebrew Package Manager
================

## What is it?

It's an [external command][ec] for [Homebrew][h]. It provides installation caveat descriptions for Homebrew packages and casks.

[ec]: https://github.com/Homebrew/brew/blob/master/docs/External-Commands.md
[h]: https://github.com/Homebrew/brew

## Usage

Although the script's names is `brew-caveats.rb`, [Homebrew external
commands][ec] work in such a way that you invoke them as `brew caveats`. (It
functions exactly like a sub-command built into Homebrew.)

If you already know the name of a package, and you want to see a bit about it, that's easy:

    $ brew caveats zsh redis mysql
    ==> zsh: Caveats
    Add the following to your zshrc to access the online help:
        unalias run-help
        autoload run-help
        HELPDIR=/usr/local/share/zsh/helpfiles
    
    ==> redis: Caveats
    To have launchd start redis now and restart at login:
        brew services start redis
    Or, if you don't want/need a background service you can just run:
        redis-server /usr/local/etc/redis.conf
    
    ==> mysql: Caveats
    We've installed your MySQL database without a root password. To secure it run:
        mysql_secure_installation
    To connect run:
        mysql -uroot
    To have launchd start mysql now and restart at login:
        brew services start mysql
    Or, if you don't want/need a background service you can just run:
        mysql.server start

This is also valid for casks:

    $ brew caveats osxfuse anaconda
    ==> osxfuse: Caveats
    To install and/or use osxfuse you may need to enable their kernel extension in
        System Preferences → Security & Privacy → General
    For more information refer to vendor documentation or the Apple Technical Note:
        https://developer.apple.com/library/content/technotes/tn2459/_index.html
    You must reboot for the installation of osxfuse to take effect.
    
    ==> anaconda: Caveats
    To use anaconda, you may need to add the /usr/local/anaconda3/bin directory to your PATH environment variable, eg (for bash shell):
        export PATH=/usr/local/anaconda3/bin:"$PATH"
    Cask anaconda installs files under /usr/local. The presence of such files can cause warnings when running "brew doctor", which is considered to be a bug in Homebrew Cask.
    

## Installation

You can install `brew caveats` with the following:

    brew tap rafaelgarrido/homebrew-caveats

Once you've installed you can use the commands as described above.
