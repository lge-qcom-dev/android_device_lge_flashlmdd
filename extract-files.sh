#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libSNPE.so|vendor/lib*/liblgdnnsnpe.so|vendor/lib*/liblgsnpeawb.so|vendor/lib*/liblgsnpeawb_beta.so)
            [ "$2" = "" ] && return 0
            ${PATCHELF_0_17_2} --replace-needed libstdc++.so libstdc++_vendor.so "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=flashlmdd
export DEVICE_COMMON=sm8150-common
export VENDOR=lge
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
