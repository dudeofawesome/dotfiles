1. install os x and clover per TonyMacx86 guide
    - EFI
        - FakeSMC
        - HFSplus.efi
        - dsdt.aml
        - theme
        - realtekALC
    - S/L/E
        - remove AppleTyMCEDriver.kext ([per this](http://www.tonymacx86.com/mountain-lion-desktop-support/86807-ml-native-ivy-bridge-cpu-gpu-power-management.html))
1. overwrite EFI partition on internal disk with saved EFI
1. install NVidia Web Drivers
1. install audio patch using [this](https://github.com/toleda/audio_CloverALC)
1. install from Multibeast
    - USB 3.0 Universal
    - AppleRTL8169Ethernet 2.0.6
