[中文](README.md)
[English](README_EN.md)
# LXC-DOCKER-KernelSU_Action

This action is for Non-GKI Kernels and has some universality and requires knowledge of the kernel and Android.

## Warning:warning::warning::warning:

If you are not the author of the Kernel, and are using someone else's labor to build KernelSU, please use it for personal use only and do not share it with others. This is to show respect for the author's labor achievements.

## Supported Kernel Versions

- `5.4`
- `4.19`
- `4.14`
- `4.9`

## Instructions

> Some workflows use Google's clang 12.0.5 compiler

> Some workflows use Google's clang 14 compiler

> Some workflows use clang 18 compiler compiled from clang official source code

> You can choose between zyc clang 18 and Mandi-Sa clang 18, Mandi-Sa clang 18 has BOLT and other optimizations

## Usage

Fork this repository to your storage account and edit the `config.env` file with the following content, then Commit changes. Afterward, click `Actions`. On the left side, you can see the workflows. Click on the workflow you want to run, and you will find the `Run workflows` option above the dialog. Click on it to start the build. Wait for the completion, then download the compiled kernel from the Artifacts below.

## Configuration Instructions

### config.env File Variables

#### Kernel Source

Change this to your Kernel repository address.

For example - https://github.com/Diva-Room/Miku_kernel_xiaomi_wayne

#### Kernel Source Branch

Change this to your Kernel branch.

For example - TDA

#### Kernel Config

Change this to your kernel configuration file name.

For example: `vendor/wayne_defconfig`

#### Kernel Zip Name

Customize the packaged kernel file name, supports English letters and numbers.

#### Enable KVM

`ENABLE_KVM`: 90% of users don't need KVM, default false is sufficient

#### Enable LXC-DOCKER

`ENABLE_LXC_DOCKER`: Set to true to enable LXC and Docker support

#### Kernel Image Name

Change this to the kernel binary that needs to be flashed:

- For low-end devices: `Image.gz-dtb`
- For high-end devices: You can choose `Image.gz`, `Image`

#### LLVM Config

`LLVM_CONFIG`: Whether LLVM=1 LLVM_IAS=1 parameters are needed, depends on your kernel source, generally needed. Fill y if needed, n if not.

#### Need DTBO

`NEED_DTBO`: Generally not needed, default false is sufficient

#### KernelSU Related Configuration

`ENABLE_KERNELSU`: Set to true if KernelSU is needed, otherwise false
`KERNELSU_TAG`: Set the branch or tag of KernelSU, main branch is development version

#### Other Configurations
- `CONFIG_BUILD_ARM64_KERNEL_COMPRESSION_GZIP=y`: Enable ARM64 kernel GZIP compression
- `CONFIG_BUILD_ARM64_APPENDED_DTB_IMAGE=y`: Enable appended DTB image
- `CONFIG_BUILD_ARM64_DT_OVERLAY=y`: Enable DT overlay

## Tips
- If compilation fails, please use clang 14 or clang 12
- High-end devices here especially refer to AB partition devices, such as OnePlus 8T, Redmi K30 Pro, Xiaomi 10, etc. Unmarked workflows are for low-end devices, such as Xiaomi 6, Redmi 5 Plus, Redmi Note 4X, Redmi 4, Redmi 4a, etc.

## Some Fix Methods
### Regarding k30pro kernel source and OnePlus 9R los kernel source, after compilation is completed, Image.gz and Image.gz-dtb files are not generated
### Solution
Add the following 3 lines of configuration at the end of the kernel configuration file, then compile again
```
CONFIG_BUILD_ARM64_KERNEL_COMPRESSION_GZIP=y
CONFIG_BUILD_ARM64_APPENDED_DTB_IMAGE=y
CONFIG_BUILD_ARM64_DT_OVERLAY=y
```

## Thanks

- [AnyKernel3](https://github.com/osm0sis/AnyKernel3)
- [AOSP](https://android.googlesource.com)
- [KernelSU](https://github.com/tiann/KernelSU)
- [xiaoxindada](https://github.com/xiaoxindada)
- [xiaoleGun](https://github.com/xiaoleGun/KernelSU_Action)
- [wu17481748](https://github.com/wu17481748/LXC-DOCKER-KernelSU_Action)
- [qiuqiu](https://github.com/lateautumn233)
- [zyc clang](https://github.com/ZyCromerZ/Clang)
- [Mandi-Sa](https://github.com/Mandi-Sa/clang)
