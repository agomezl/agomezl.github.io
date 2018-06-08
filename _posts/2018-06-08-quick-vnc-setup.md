---
title: Quick VNC setup
updated: 2018-06-08
---

So, let say you need to connect to a remote computer to access some
graphical aplication (browser,editor,some weird-ass information
system,etc) and the old `ssh user@host -X` will not do the trick, what
do you do? VNC, of course. For this this work a number of things need
to be true:

### Prerequisites

* You can install software in both remote and local machines
* You can ssh into the remote machine

### VNC Server (Remote machine)

You need to install a vnc-server

```bash
$ sudo dnf install vnc-server
```

and then start the server

```bash
$ vncserver :1

```

that is it! this is a **VERY** usafe and crappy way to do this, but if
works it you are in a hurry =P

### VNC Client (Local machine)

Connect to the remote machine using

```bash
$ ssh -L 5901:localhost:5901 remote_host
```

and then, in another (local) terminal

```bash
$ vncviewer localhost:1

```

Done! no firewall setup, no long configuration, you will get a weird
basic terminal from which you can start whatever it is you need.
