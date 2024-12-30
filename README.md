# Block ota.googlezip.net

This simple module will block access to `ota.googlezip.net` on dns level (by overwriting the `/etc/hosts` file).

## Why would i need that?
This is a workaround for battery drainage on some pixel-like custom roms. On PixelOS 14 (running on cepheus), I noticed that my phone is getting warm even when nothing is running, and i run out of battery in less than 6 hours.
In logcat, i noticed, that `SystemUpdate` process is looping and spamming the logs with `Allocating file /cache/metadata ` and `Unable to create the action`.
<details>
  <summary>logs</summary>

```
12-29 11:12:32.147  9415 21318 I SystemUpdate: [Execution,PackageFiles] Allocating file /cache/metadata with size 667.
12-29 11:12:32.152  9415 10640 I SystemUpdate: [Execution,ExecutionManager] Action pre-download-validate executed for 0.38 seconds.
12-29 11:12:32.155  9415 10640 W SystemUpdate: [Execution,ExecutionManager] Unable to create the action. Restart the execution from the scratch.
12-29 11:12:32.155  9415 10640 W SystemUpdate: java.lang.IllegalStateException
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at aonr.l(:com.google.android.gms@244738029@24.47.38 (190400-705893532):6)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at dyky.a(:com.google.android.gms@244738029@24.47.38 (190400-705893532):325)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at com.google.android.gms.update.execution.InstallationIntentOperation.onHandleIntent(:com.google.android.gms@244738029@24.47.38 (190400-705893532):119)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at com.google.android.chimera.IntentOperation.onHandleIntent(:com.google.android.gms@244738029@24.47.38 (190400-705893532):2)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at akvb.onHandleIntent(:com.google.android.gms@244738029@24.47.38 (190400-705893532):8)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at pip.run(:com.google.android.gms@244738029@24.47.38 (190400-705893532):70)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at pio.run(:com.google.android.gms@244738029@24.47.38 (190400-705893532):152)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at eyvl.run(:com.google.android.gms@244738029@24.47.38 (190400-705893532):21)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:644)
12-29 11:12:32.155  9415 10640 W SystemUpdate: 	at java.lang.Thread.run(Thread.java:1012)
12-29 11:12:32.160  9415 10640 I SystemUpdate: [Execution,ExecutionManager] Action pending executed for 0.01 seconds.
12-29 11:12:32.512  9415 21318 I SystemUpdate: [Execution,PackageFiles] Allocating file /cache/metadata with size 667.
12-29 11:12:32.518  9415 10640 I SystemUpdate: [Execution,ExecutionManager] Action pre-download-validate executed for 0.36 seconds.
12-29 11:12:32.521  9415 10640 W SystemUpdate: [Execution,ExecutionManager] Unable to create the action. Restart the execution from the scratch.
12-29 11:12:32.521  9415 10640 W SystemUpdate: java.lang.IllegalStateException
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at aonr.l(:com.google.android.gms@244738029@24.47.38 (190400-705893532):6)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at dyky.a(:com.google.android.gms@244738029@24.47.38 (190400-705893532):325)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at com.google.android.gms.update.execution.InstallationIntentOperation.onHandleIntent(:com.google.android.gms@244738029@24.47.38 (190400-705893532):119)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at com.google.android.chimera.IntentOperation.onHandleIntent(:com.google.android.gms@244738029@24.47.38 (190400-705893532):2)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at akvb.onHandleIntent(:com.google.android.gms@244738029@24.47.38 (190400-705893532):8)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at pip.run(:com.google.android.gms@244738029@24.47.38 (190400-705893532):70)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at pio.run(:com.google.android.gms@244738029@24.47.38 (190400-705893532):152)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at eyvl.run(:com.google.android.gms@244738029@24.47.38 (190400-705893532):21)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:644)
12-29 11:12:32.521  9415 10640 W SystemUpdate: 	at java.lang.Thread.run(Thread.java:1012)
12-29 11:12:32.526  9415 10640 I SystemUpdate: [Execution,ExecutionManager] Action pending executed for 0.01 seconds.
12-29 11:12:32.530  9415 10640 I SystemUpdate: [Control,InstallationControl] Installation progress updated to (0x017, -1.000).
12-29 11:12:32.926  9415 21318 I SystemUpdate: [Execution,PackageFiles] Allocating file /cache/metadata with size 667.
12-29 11:12:32.932  9415 10640 I SystemUpdate: [Execution,ExecutionManager] Action pre-download-validate executed for 0.41 seconds.
```


</details>  

[`intheflow` on the xda forum noticed](https://xdaforums.com/t/rom-14-official-stable-pixelos-retrofit-16-10-2024-cepheus.4458805/post-89871815), that the OS is constantly connecting to `ota.googlezip.net`, so as a test, i decided to block the domain on DNS level. This solved the issue and my battery was no longer draining that fast. 

I'm not a expert on android modding, but via a research online, i belive that issue is due spoofing device information on pixel-based roms.  
reference:
* https://github.com/PixelExperience/android-issues/issues/4478
* https://xdaforums.com/t/temp-fix-root-reqd-high-cpu-usage-and-battery-drain-due-to-google-play-services.4406617/

### Why not just disable `GmsIntentOperationService`?
I tried, but all I get is `cmd: Failure calling service package: Failed transaction`.
