<table border="0">
  <tr>
    <td align="left" valign="middle">
    <h1>Wi-SUN Node Monitoring Application</h1>
  </td>
  <td align="left" valign="middle">
    <a href="https://www.silabs.com/wireless/wi-sun">
      <img src="http://pages.silabs.com/rs/634-SLU-379/images/WGX-transparent.png"  title="Silicon Labs Gecko and Wireless Gecko MCUs" alt="EFM32 32-bit Microcontrollers" width="100"/>
    </a>
  </td>
  </tr>
</table>

![Type badge      ](https://img.shields.io/badge/dynamic/json?url=https://raw.githubusercontent.com/SiliconLabs/application_examples_ci/master/wisun_applications/wisun_node_monitoring.json&label=Type&query=type&color=green)
![Technology badge](https://img.shields.io/badge/dynamic/json?url=https://raw.githubusercontent.com/SiliconLabs/application_examples_ci/master/wisun_applications/wisun_node_monitoring.json&label=Technology&query=technology&color=green)
![License badge   ](https://img.shields.io/badge/dynamic/json?url=https://raw.githubusercontent.com/SiliconLabs/application_examples_ci/master/wisun_applications/wisun_node_monitoring.json&label=License&query=license&color=green)
![SDK badge       ](https://img.shields.io/badge/dynamic/json?url=https://raw.githubusercontent.com/SiliconLabs/application_examples_ci/master/wisun_applications/wisun_node_monitoring.json&label=SDK&query=sdk&color=green)
## Summary ##

This project aims to implement a Wi-SUN network monitoring system using a Linux Border Router and a Wi-SUN node monitoring application flashed on [Wi-SUN capable Silicon Labs development kits](https://www.silabs.com/wireless/wi-sun?tab=hardware).

The block diagram of this application is shown in the image below:

<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/images/Screenshot%202024-05-23%20111258.png" alt="MLBC">

- To learn Wi-SUN technology basics, see [the Wi-SUN pages on docs.silabs.com](https://docs.silabs.com/wisun/latest/wisun-start/).

- To learn code-level information on the node monitoring application, see [Add a Custom Application in the Wi-SUN Development Walkthrough](https://docs.silabs.com/wisun/latest/wisun-custom-application/)

## Gecko SDK Version ##

GSDK v4.4.2

## Hardware Required ##

The following is required to run the demo:

- A Linux platform, which will be used as
  - The [Linux Wi-SUN Border Router](https://www.silabs.com/documents/public/application-notes/an1332-wi-sun-network-configuration.pdf#page=8)
  - A UDP receiver, listening for initial connection and regularly sent status messages from all connected Wi-SUN nodes
  - A CoAP client used to get CoAP resources provided by the device application and remotely control some application parameters.
- One [Wi-SUN Evaluation kit](https://www.silabs.com/wireless/wi-sun?tab=kits) used as the Border Router's Wi-SUN RCP (Radio Co-Processor).
- One or more [Wi-SUN Evaluation kit(s)](https://www.silabs.com/wireless/wi-sun?tab=kits) used as the Wi-SUN nodes.

## Connections Required ##

The Wi-SUN RCP (Radio Co-Processor) must be connected to the Linux platform as detailed in [AN1332 Wi-SUN Network Configuration](https://www.silabs.com/documents/public/application-notes/an1332-wi-sun-network-configuration.pdf), either using

- A USB connection between the Linux Platform and a Wi-SUN Pro kit

images/<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/images/Screenshot%202024-05-23%20111328.png" alt="MLBC">

or

- A Raspberry Pi supporting the RCP Radio Board via a BRD8016A Expansion Board. A BRD8016A board is included in the [Wi-SUN Pro Kits](https://www.silabs.com/wireless/wi-sun?tab=kits) with the Wi-SUN Radio Board

<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/images/Screenshot%202024-05-23%20111230.png" alt="MLBC">

## The Application Requires a Bootloader ##

This example application support OTA DFU, therefore you need to create and flash a **bootloader** to your devices before flashing the **Wi-SUN Node Monitoring** Application.

## Setup ##

A single example application is required in order to use this demonstration: **Wi-SUN Node Monitoring**, created based on **Wi-SUN -SoC Empty** provided by Simplicity Studio.

To test this application, you can

- [Add the 'Wi-SUN Applications' Repository to Simplicity Studio 5](../README.md#add-the-wi-sun-applications-repository-to-simplicity-studio-5)
- Create the Wi-SUN Applications 'Wi-SUN Node Monitoring' Project as described [here](../README.md#create-the-wi-sun-applications-example-projects)

## Communication methods ##

The demonstration uses a Wi-SUN network, supporting

- UDP (natively)
- CoAP (using the Wi-SUN CoAP Service)
- OTA DFU (this requires using a bootloader with storage enabled and the selected compression mechanism installed)

## How it works ##

### Wi-SUN Network Set Up ###

- A [Linux Wi-SUN Border Router](https://github.com/SiliconLabs/wisun-br-linux) is set up and started, waiting for Wi-SUN nodes to connect.
- Convenience scripts are copied from [linux_border_router_wsbrd](linux_border_router_wsbrd) to the user's home. Bash scripts are made executable using
  - `chmod a+x coap_all`
  - `chmod a+x ipv6s`
  - `chmod a+x *.sh`
- The [UDP notification receiver](linux_border_router_wsbrd/udp_notification_receiver.py) is started using
  - `python udp_notification_receiver.py 1237 " "`, waiting for messages from the Wi-SUN Nodes on port `1237`.
- The application is built and flashed to all Wi-SUN devices

### Wi-SUN Nodes Connection ###

- The application firmware is configured with the same network settings as the Border Router, with automatic connection.

- **Node Initial Connection** – After the application firmware is installed, the devices connect automatically to the Wi-SUN network, selecting the best parent, using several hops if needed, as in any Wi-SUN network.

- **Initial Connection Message** - Once connected, each node sends an initial UDP connection message to the Border Router's IPv6 address on port 1237.

### Network Monitoring ###

- **Automatic Status Messages** – Every `auto_send` seconds (default 60), the connected devices send a status message to the Border Router's IPv6 address on port 1237.

- **Monitoring** – `coap-client` can be used to monitor any connected device. this includes CoAP discovery of the available resources, and retrieving each of these resources at will.

### Network Control ###

- **Controlling Devices** – Some CoAP resources support a payload to control the application settings. The example used in the demo controls the `auto_send` period, which can be increased once the device has been connected for a while, reducing the amount of traffic on the network, which can be important to save power and support many devices.

### Normal Mode ###

Once all devices are connected, the [`coap_all`](linux_border_router_wsbrd/coap_all) bash script allows sending the same CoAP request to all connected devices, allowing an easy monitoring of the entire network.

### CoAP Resources ###

The following resources are available via CoAP, split in several groups. To reduce the initial code size, some are only conditionally compiled:

- 'statistics' for values accumulated over time
  - 'statistics/app' for values coming from the application
    - 'statistics/app/all' returns all of the app statistics. This is the most commonly used URI
    - Adding '-e reset' resets these statistics
  - 'statistics/stack' for values coming from the stack
    - WARNING: **NO** 'statistics/stack/all' for stack statistics, because the corresponding strings are bigger than the max buffer used. When using stack statistics a user is also generally interested in a single subset of the available statistics.
- 'settings' for parameters of the application we want to check or change via CoAP

The URIs are

| CoAP URI                        | Item                                        | format | Possible payload |
|:--------------------------------|:------------------------------------------- |:-------|:-----------------|
|info/device                      | last 4 digits of device MAC/IPv6 (as in the [wisun-br-gui](https://github.com/SiliconLabs/wisun-br-gui)) | '%04x' ||
|info/chip                        | Silicon Labs part                           | 'xGyy'         ||
|info/board                       | Silicon Labs Radio Board                    | 'BRDxxxxx'     ||
|info/application                 | Application information string              | 'Wi-SUN Node Monitoring' ||
|info/version                     | Application version string                  | 'Compiled on %s at %s' ||
|info/all                         | all of the 'info' group above               | json           ||
|status/running                   | time since application booted               | 'ddd-hh:mm:ss' ||
|status/parent                    | parent tag                                  | '%04x'         ||
|status/neighbor                  | number of neighbors                         | '%d'           | '-e n' returns info for neighbor n (from [sl_wisun_neighbor_info_t](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-neighbor-info-t) |
|status/connected                 | time since last connection                  | 'ddd-hh:mm:ss' ||
|status/all                       | all of the 'status' group above             | json           ||
|statistic/app/join_states_sec    | array of seconds spent to reach each join state (1 to 5) | 'ddd-hh:mm:ss' ||
|statistic/app/disconnected_total |  | 'ddd-hh:mm:ss' ||
|statistic/app/connections        |  | '%d'           ||
|statistic/app/connected_total    |  | 'ddd-hh:mm:ss' ||
|statistic/app/availability       |  | '%6.2f'        ||
|statistic/app/all                | all of the 'statistics/app' group above     | json ||
|statistics/stack/phy             | statistics from [sl_wisun_statistics_phy_t](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-statistics-phy-t)               | json | '-e reset' resets these statistics |
|statistics/stack/mac             | statistics from [sl_wisun_statistics_mac_t](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-statistics-mac-t)               | json | '-e reset' resets these statistics |
|statistics/stack/fhss            | statistics from [sl_wisun_statistics_fhss_t](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-statistics-fhss-t)             | json | '-e reset' resets these statistics |
|statistics/stack/wisun           | statistics from [sl_wisun_statistics_wisun_t](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-statistics-wisun-t)           | json | '-e reset' resets these statistics |
|statistics/stack/network         | statistics from [sl_wisun_statistics_network_t](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-statistics-network-t)       | json | '-e reset' resets these statistics |
|statistics/stack/regulation      | statistics from [sl_wisun_statistics_regulation_t](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-statistics-regulation-t) | json | '-e reset' resets these statistics |
|settings/auto_send               | the current `auto_send_sec` value           | '%d' | '-e s' sets auto_send_sec to s     |
|settings/trace_level             | the current `trace_level` value             | '%d' | '-e [0-4]' sets trace_level [(0=None to 4=DEBUG)](https://docs.silabs.com/wisun/latest/wisun-stack-api/sl-wisun-types#sl-wisun-trace-level-t) |

## .slcp Project Used ##

- [wisun_node_monitoring.slcp](https://github.com/SiliconLabs/wisun_applications/blob/main/wisun_node_monitoring/wisun_node_monitoring.slcp)

## How to Port to Another Part ##

- Connect the new hardware with the new part
- Select it in Simplicity Studio
- Create, build and flash a **bootloader** application to your device (the application supports OTA DFU, which requires a bootloader)
- [Add the 'Wi-SUN Applications' Repository to Simplicity Studio 5](https://github.com/SiliconLabs/wisun_applications/blob/main/README.md#add-the-wi-sun-applications-repository-to-simplicity-studio-5)
- In the Launcher's EXAMPLE PROJECTS & DEMOS, Select **wisun_applications** in the 'Provider' Area (at the bottom of the list)
  - if the project doesn't appear in the list
    - Uncheck all filter boxes in the filter area except **wisun_applications**
    - Check that your hardware is compatible with Wi-SUN (it should be possible to create Wi-SUN projects)
- Create a new **Wi-SUN Node Monitoring Application** project
- Use the Wi-SUN Configurator to set the Network (Name/Tx power/PHY) to match the Border Router settings
- Use the SOFTWARE COMPONENTS/Wi-SUN Over-The-Air Device Firmware Upgrade (OTA DFU) GUI or `config/sl_wisun_ota_dfu_config.h` to set OTA DFU to match the Border Router settings

## LFN parenting and LFN device ##

(Refer to [LFN in Silicon Labs Wi-SUN Stack](https://docs.silabs.com/wisun/latest/wisun-lfn/#lfn-in-silicon-labs-wi-sun-stack) for details on Wi-SUN LFN, including power management aspects)

Adding the **Wi-SUN Stack LFN Support Plugin** is required to turn the device into a LFN.

With GSDK 4.4.0, the 'Wi-SUN Stack LFN Support Plugin' is listed with 'Evaluation' quality in Simplicity Studio, so it is found in the 'SOFTWARE COMPONENTS' once the 'Evaluation' level has been selected in the 'Quality' drop down list.

![LFN Plugin Component]
<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/images/Screenshot%202024-05-23%20110854.png"  alt="MLBC">
Install this component to get access to the 'Device Type' Drop down box in the Wi-SUN Configurator.

![Device Type Box]
<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/images/Screenshot%202024-05-23%20110958.png" alt="MLBC">

This box selects the value set for `WISUN_CONFIG_DEVICE_TYPE` in `autogen\sl_wisun_config.h`.

![WISUN_CONFIG_DEVICE_TYPE]
<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/images/Screenshot%202024-05-23%20111133.png" alt="MLBC">

## Access to RTT traces ##

The project being based on Wi-SUN SoC Empty, which doesn't include the **wisun_stack_debug** component, this component is added to the `.slcp` file. This can be uninstalled for release versions of the application.
# Installation of Simplicity studio -V5
To know more about Simplicity Studio, you can go through the user guide
(https://docs.silabs.com/simplicity-studio-5-users-guide/5.3.0/ss-5-users-guide-overview/)
Search Silicon labs Simplicity Studio on a browser,
Create an Account in Simplicity Studio and
Click on Required Installer
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20104138.png" alt="MLBC">

Go through the below video for complete installation process
(https://youtu.be/ONrmMEgFYMo?si=FESHt9YXUVKaqHwz)
SDK Version: Gecko SDK Suite v4.4.2
# Getting Started with Wi-SUN
#Setting Up Wi-SUN Border Router
To setup Wi-SUN Br follow the below repository
(https://github.com/SiliconLabs/wisun-br-linux)
# Installation of Wi-SUN Border Router GUI
Follow the below Repository to setup BR GUI
(https://github.com/SiliconLabs/wisun-br-gui)
# Cockpit Launch

Cockpit features are accessible through its Web interface. It is available at http://[border router server]:9090/.
If the plugin was installed correctly, it should appear in the left side panel of Cockpit's Web interface as Wi-SUN Border Router.
After setting up login by providing the required credentials

<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20105145.png" alt="MLBC">

# Wi-SUN Dashboard

The Wi-SUN Dashboard tab provides direct access to wsbrd.conf configuration file. It gives the ability to change your wsbrd configuration without the need to physically access the Raspberry Pi. The Wi-SUN Border Router service box allows the user to start, restart or stop the Wi-SUN Border Router service by clicking the three dots dropdown. The other boxes expose the Wi-SUN Border Router active configuration.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20105200.png" alt="MLBC">
# FAN1.1-FSK-Application:
Node Monitoring
Wi-SUN Node Monitoring is an extendable node monitoring application that provides information on the device, board, application, and connection statistics. It can be easily extended to monitor sensors and control actuators.
# Adding Required Repositories:
Add the Wi-SUN Applications Repository to Simplicity Studio
1. Open Simplicity Studio and connect the Main board.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110119.png" alt="MLBC">
2. Navigate to `Window` -> `Preferences` -> `Simplicity Studio` -> `External Repos`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110129.png" alt="MLBC">
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110141.png" alt="MLBC">
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110151.png" alt="MLBC">
3. Click on `Add` and paste the URI of the repository: 
(https://github.com/SiliconLabs/wisun_applications.git)
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110202.png" alt="MLBC">
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110212.png" alt="MLBC">
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110223.png" alt="MLBC">
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20110232.png" alt="MLBC">

# Adding Repository for updated codes:
Clone the below Repository in your system 
(https://github.com/vaibhavnaware01/FAN11_FSK_FG25.git)

# Create Bootloader Project:
1.	Click on `Bootloader- SoC SPI Flash Storage( 1024)` and then click on `Create`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112354.png" alt="MLBC">
2.check the project configuration
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112402.png" alt="MLBC">
3.Open Configuration File
   - Open the `.slcp` file in your project directory.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112412.png" alt="MLBC">
4.Configure Software Components- Configure the necessary software components as required for your project.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112421.png" alt="MLBC">
Install LZMA
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112429.png" alt="MLBC">
5.Build the Project- Build the project to compile the code and prepare it for flashing.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112440.png" alt="MLBC">
Ensure the build completes with zero errors.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112448.png" alt="MLBC">
6.Erase and Flash to the Device:
   - Navigate to the `.s37` file in the binaries folder.
   - First, erase the existing firmware on the device.
   - Then, program and flash the new firmware onto the device.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112502.png" alt="MLBC">
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20112514.png" alt="MLBC">

# Creating Node Monitoring Application:
1.click on start:
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114557.png" alt="MLBC">
2.Click on Example Projects and Demos.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114621.png" alt="MLBC">
3. Scroll down to the provider section, where you will find Wi-SUN applications listed along with the Gecko SDK.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114628.png" alt="MLBC">
4. Click on `Wi-SUN Applications`.
5. Locate the resource called `Wi-SUN Node Monitoring Application` and click on `Create`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114638.png" alt="MLBC">
6.Project Configuration:
1. You will be prompted with the project configuration screen, where you can select the target SDK and examples.
2. Review and confirm the project name and location.
3. Click on `Finish` to complete the setup.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114645.png" alt="MLBC">
7.Board Configuration
Now a new project is created. Follow these steps to configure the board:
 Access the Project Configuration
1.Locate the project file in your project directory.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114655.png" alt="MLBC">
Right click on the project file and go to show in and then to system explorer
<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/images/Screenshot%202024-05-23%20121541.png" alt="MLBC">
Here we will find the all the files of our project
<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/Screenshot%202024-05-23%20142657.png" alt="MLBC">
Delete the following files from that place -app,app_check_neighbour,app_coap,app_init,app_rtt_traces,app_tcp_server,app_timestamp,app_udp_server,both .c and .h files and  main.c and go to this repository (https://github.com/vaibhavnaware01/FAN11_FSK_FG25)
<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/Screenshot%202024-05-23%20125624.png" alt="MLBC">
download those files from the Repository and paste them in your system project folder.
Go to the autogen folder of your project file ,in this Repository ,you will find all the files with the same names 
<img src="https://github.com/vaibhavnaware01/FAN11_FSK_FG25/blob/main/Screenshot%202024-05-23%20125632.png" alt="MLBC">
Delete the sl_wisun_config.h file and you will find the same file in our repository download it and place it here.

Click on the .slcp file in binary folder
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114703.png" alt="MLBC">
# Wi-SUN board configuration
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114715.png" alt="MLBC">
Applications: Here, you will find network information such as the network name and size.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114721.png" alt="MLBC">
Security: This section contains the device's private key, device certificate, and other security-related settings.

Radio:For Wi-SUN FAN 1.0: You can configure the regulatory domain, operating class, and operating mode.For Wi-SUN FAN 1.1: You can configure the regulatory domain, PHY operating mode ID, and channel ID.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114730.png" alt="MLBC">
 8.Apply Configuration
1. Provide the necessary information in each section.
2. Click on `Apply Configuration` and save the changes.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114752.png" alt="MLBC">
And press ctrl+s to save the Wi-SUN configuration
9.Build the Project 1.Go to the Project Explorer, right-click on your project name, and select `Build Project`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114800.png" alt="MLBC">
2. Ensure the build completes with zero errors.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114807.png" alt="MLBC">
10.Flash the Device
1.	After the build is finished, navigate to the `binaries` folder.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114831.png" alt="MLBC">
2. Locate the `.s37` file, click on it, and select `Flash to Device`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114840.png" alt="MLBC">
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20114847.png" alt="MLBC">

# Checking Network Connection
To verify if the device is connected to the desired network, follow these steps:
# Retrieve the MAC Address
1.	Connect the device to your system.
2.Go to Debug adapters and right click on the board name
3. Click on `Launch Console`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20121225.png" alt="MLBC">
4. If the device is successfully connected to the network, you will see the five states.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20121230.png" alt="MLBC">
5. You can get the MAC address of the device
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20121245.png" alt="MLBC">
# Verify Connection in Cockpit Interface
1. Open the Cockpit interface.
2. Click on `Terminal`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20121250.png" alt="MLBC">
3. Enter the command `wsbrd_cli status`.
<img src="https://github.com/Joswitha-123/wisunreadme/blob/main/Screenshot%202024-05-22%20121256.png" alt="MLBC">
4. This will display the connected nodes. You can check here to confirm if your device is connected to the network.
# Cross-Check via Topology
1. Alternatively, you can click on `Topology` in the Cockpit interface.
2. Locate your node in the displayed network topology to verify its connection status.
3. For this version ,this won’t work, we can do this for the versions which it can be applicable

## Nodes Information

| Node ID    | Pole Number                      | IPv6 Address                             | Lat, Long              |
|------------|----------------------------------|------------------------------------------|------------------------|
| WN-L031-30 | 2                                | FD12:3456::B635:22FF:FE98:2537           | 17.443894,78.349547    |
| WN-L032-30 | 4                                | FD12:3456::B635:22FF:FE98:2523           | 17.443754,78.349237    |
| WN-L033-30 | 6                                | FD12:3456::B635:22FF:FE98:252B           | 17.44443843,78.348820  |
| WN-L034-30 | 18                               | FD12:3456::62A4:23FF:FE37:A3B3           | 17.444449,78.350024    |
| WN-L035-30 | PT21                             | FD12:3456::B635:22FF:FE98:285B           | 17.4444563,78.34862    |
| WN-L036-30 | 17C                              | FD12:3456::62A4:23FF:FE37:A3A1           | 17.443230,78.348910    |
| WN-L037-30 | 17Z                              | FD12:3456::92FD:9FFF:FEEE:9D4D           | 17.4437708,78.3481379  |
| WN-OF04-34 | Faculty quarter control point    | FD12:3456::B635:22FF:FE98:285C           | 17.4438353,78.34898847 |

      

