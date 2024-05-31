################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk/app/wisun/component/event_manager/sl_wisun_event_mgr.c 

OBJS += \
./gecko_sdk_4.4.2/app/wisun/component/event_manager/sl_wisun_event_mgr.o 

C_DEPS += \
./gecko_sdk_4.4.2/app/wisun/component/event_manager/sl_wisun_event_mgr.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.2/app/wisun/component/event_manager/sl_wisun_event_mgr.o: C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk/app/wisun/component/event_manager/sl_wisun_event_mgr.c gecko_sdk_4.4.2/app/wisun/component/event_manager/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DEFR32FG25B222F1920IM56=1' '-DSL_APP_PROPERTIES=1' '-DSL_BOARD_NAME="BRD4271A"' '-DSL_BOARD_REV="A06"' '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' '-DHFXO_FREQ=39000000' '-DconfigNUM_SDK_THREAD_LOCAL_STORAGE_POINTERS=2' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DSL_DEVICE_INIT_AUTO_BAND_VALID=1' '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' '-DRTT_USE_ASM=0' '-DSEGGER_RTT_SECTION="SEGGER_RTT"' -I"C:\Users\Vaibhav\SimplicityStudio\v5_workspace\wisun_node_monitoring\config" -I"C:\Users\Vaibhav\SimplicityStudio\v5_workspace\wisun_node_monitoring\config\rail" -I"C:\Users\Vaibhav\SimplicityStudio\v5_workspace\wisun_node_monitoring\config\wisun" -I"C:\Users\Vaibhav\SimplicityStudio\v5_workspace\wisun_node_monitoring" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32FG25/Include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/app_project_info" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/bootloader" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/bootloader/api" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/RTOS2/Include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/configuration_over_swo/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/security/sl_component/sl_mbedtls_support/config" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/security/sl_component/sl_mbedtls_support/config/preset" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/security/sl_component/sl_mbedtls_support/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//util/third_party/mbedtls/include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//util/third_party/mbedtls/library" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/micrium_os/common/source" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/micrium_os/common/include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/micrium_os/cpu/include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/micrium_os/ports/source" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/micrium_os" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/micrium_os/kernel/source" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/micrium_os/kernel/include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_eusart" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/nvm3/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/peripheral/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//util/third_party/printf" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//util/third_party/printf/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/security/sl_component/sl_psa_driver/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/common" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/protocol/ble" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/protocol/ieee802154" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/protocol/wmbus" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/protocol/zwave" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/chip/efr32/efr32xg2x" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/protocol/sidewalk" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/plugin/pa-conversions" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/plugin/pa-conversions/efr32xg25" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/radio/rail_lib/plugin/rail_util_pti" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/security/sl_component/se_manager/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/security/sl_component/se_manager/src" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//util/third_party/segger/systemview/SEGGER" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//util/silicon_labs/silabs_core/memory_manager" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/ftp" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/mempool" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/app_core" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/coap" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/coap/mbed-coap" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/coap/mbed-trace" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/coap/mbed-client-randlib" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/coap/mbed-coap/include" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/event_manager" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/ns_list" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/ota_dfu" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/trace_util" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//app/wisun/component/trace_util/nanostack/nanostack-libservice/mbed-client-libservice" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/service/sleeptimer/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//protocol/wisun/plugin" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//protocol/wisun/stack/inc" -I"C:/Users/Vaibhav/SimplicityStudio/SDKs/gecko_sdk//protocol/wisun/stack/inc/socket" -I"C:\Users\Vaibhav\SimplicityStudio\v5_workspace\wisun_node_monitoring\autogen" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -fno-builtin-printf -fno-builtin-sprintf --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.2/app/wisun/component/event_manager/sl_wisun_event_mgr.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


