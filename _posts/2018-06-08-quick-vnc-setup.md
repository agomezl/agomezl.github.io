---
title: Quick VNC setup
updated: 2018-06-08
---

So!, lets say you need to connect to a remote computer to access some
graphical application (browser, text-editor,some obscure information
system, etc) and the old `ssh user@host -X` will just not cut it, what
do you do? **VNC** of course. For this specific *recipe* to work a number
of things need to be true:

### Prerequisites

* You can install software in both remote and local machines
* You can ssh into the remote machine
* The connection between both machines is stable and has low latency (<50ms)
* Both machines run Linux, here we use Fedora but the only real difference
  between distros is the names of the `tigervnc` and `tigervnc-server` packages

### VNC Server (Remote machine)

Firs install a VNC server

```bash
$ sudo dnf install tigervnc-server
```

and then start the server

```bash
$ vncserver :1
```

that is it! this is a **VERY** unsafe and crappy way to do this, you
can improve security a bit (for tigervnc at least) by editing `~/.vnc/config`

```
securitytypes=None
localhost
```

This will allow for password-less authentication (*yuck!*) but
will only accept connections from `localhost` (which is nice!)

### VNC Client (Local machine)

Install a VNC client
```
$ sudo dnf install tigervnc
```

Connect to the remote machine using this fancy `ssh` command

```bash
$ ssh -L 5901:localhost:5901 -fN remote_host
```

followed by:

```bash
$ vncviewer localhost:1
```

Done! no firewall setup, no long configuration. From here you will get
a basic terminal from which you can start whatever it's that you need.
