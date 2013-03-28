AutoAdHoc
=========

An Applescript to have your computer automatically create an adhoc network, or to join it if it already exists. (I use it on startup so I have some delays in there).

I borrowed most of the logic from http://www.svenbit.com/2011/02/create-a-new-wireless-network-ad-hoc-on-mac-os-using-an-applescript/
but added in the condition to join the network if it already exists.


  It's for a Mac Mini with no keyboard, mouse or monitor that is meant to be a portable media server (so it isn't meant to just join an existing wireless network).

  If a device joins an ad hoc network, and then the creater of that network disconnects, the adhoc network still exists. So if the Mac Mini tried to recreate the wireless network on startup it would cause an error, which would require a monitor & keyboard to fix. This makes it a little more reliable to access the Mac Mini.
