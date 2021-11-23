# Java
Follow these steps to be able to use old iDRAC/IPMI clients

* Install OpenWebStart https://openwebstart.com/
* Download and extract an archive of the old Coretto 8.232.09.1 JVM from https://github.com/corretto/corretto-8/releases/tag/8.232.09.1
* Launch "OpenWebStart Settings"
* go to JVM Manager
* Use the Add button and select the folder where you extracted the JVM earlier
* make sure no other JVMs are enabled
* Optional: Click the Settings Button and disable JVM Updates (or simply don't download newer JVMs when OpenWebStart asks you to)
* Log in to iDRAC and launch the virtual console
* a download will start, save the file and rename it to "viewer.jnlp"
* launch viewer.jnlp
