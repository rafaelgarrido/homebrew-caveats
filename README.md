Formulae Caveats Shortcut for Homebrew Package Manager
================

## What is it?

It's an [external command][ec] for [Homebrew][h]. It provides installation caveat descriptions for Homebrew packages.

[ec]: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/External-Commands.md
[h]: https://github.com/Homebrew/homebrew

## Usage

Although the script's name is `brew-caveats.rb`, [Homebrew external
commands][ec] work in such a way that you invoke it as `brew caveats`. (It
functions exactly like a sub-command built into Homebrew.)

If you already know the name of a package, and you want to see a bit about it, that's easy:

    $ brew caveats zsh redis mysql foobarbazxpto42
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

## Installation

You can install `brew caveats` in two ways.

1. Tap this repository and install via `brew` itself.
1. Install manually.

For the first method, do the following:

    brew tap rafaelgarrido/homebrew-caveats && brew install brew-caveats

For the second method clone or download this repository. Then simply put the file `cmd/brew-caveats.rb` anywhere in your `$PATH`. For example:

    mv cmd/brew-caveats.rb ~/bin

Leave the name as is if you follow this method. Homebrew knows how to find it.

Once you've installed via either method, you can use the command as described above.
