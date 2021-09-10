#!/bin/bash
#
# Basic ADB multifile pusher
#

proprietary_files_contents='
vendor/lib/libsdm-disp-apis.so|39d52eb5e311950a6b8eca35ac53758e7297e9cf
vendor/lib64/libsdm-disp-apis.so|752de98fed59c7d161a113b62d46e20a2c939789
vendor/lib/egl/eglSubDriverAndroid.so|89f22710e92951bd45d7772dc9d882c582cb8c0e
vendor/lib/egl/libEGL_adreno.so|cbc052526a10907b5dc0ca2e53a37570adc3a317
vendor/lib/egl/libGLESv1_CM_adreno.so|6c63055e6ac76dc5c7cd7842e697a66a71571f4b
vendor/lib/egl/libGLESv2_adreno.so|88037d2b42e951f71154f66f52e02e08cb1be113
vendor/lib/egl/libq3dtools_adreno.so|e211af37469cafbb1fd814c6ba90ba9629097379
vendor/lib/egl/libq3dtools_esx.so|2e02f5101131019ee97014f8d75e84fdf15770dc
vendor/lib/hw/vulkan.adreno.so|684883ab2e2376903a3c311c9216b634fca216f6
vendor/lib/libC2D2.so|64e2a5a20312e5cb59c23b3a3a99bf8912946ed3
vendor/lib/libOpenCL.so|75c7ce3463e41429e51e00c6acbf93a2188a3129
vendor/lib/libadreno_utils.so|baa256389d74875742269411f38d508e3341913d
vendor/lib/libc2d30_bltlib.so|f3667f469dab7b3d5023785c6139819b557b3ed0
vendor/lib/libgpudataproducer.so|0eb31eeb15096110b15dcf78ecdae244d5243522
vendor/lib/libgsl.so|ba2d6510f007556c7c313a232073258770af4e2b
vendor/lib/libhdr_tm.so|3d899ac8b0e6370295ab56ad95076e3c00140f75
vendor/lib/libllvm-glnext.so|beaa9203400ad4598770c808c629637dd66aa5c9
vendor/lib/libmm-hdcpmgr.so|985495bc86a198aa9ecb495c5a10a4aa10cfcadd
vendor/lib/libpvr.so|34a02d80caef357e673732661810207c9cb32a22
vendor/lib/libVkLayer_q3dtools.so|ce43cb3464f910982b3fd1f493045445107b7764
vendor/lib64/egl/eglSubDriverAndroid.so|d5bc7ac6e13e88fa7b58c2034b85fcba075581b2
vendor/lib64/egl/libEGL_adreno.so|da4b09fc0bf7c82c267d227dda812b46db52deb7
vendor/lib64/egl/libGLESv1_CM_adreno.so|ebafbd6ce0caf448a5bcfd604cdfe115e3af520a
vendor/lib64/egl/libGLESv2_adreno.so|f5edf1d2439ec0793ea156d43cd006530105d786
vendor/lib64/egl/libq3dtools_adreno.so|d8c8f25332d218a2dbd7cc5052e384b59d07c5a1
vendor/lib64/egl/libq3dtools_esx.so|6ae4b945718fe7e1b6404d7b65d382c32b4fef54
vendor/lib64/hw/vulkan.adreno.so|f4a2bac57b55790f736adb53ffb4424d518be16b
vendor/lib64/libC2D2.so|6fb775e393ce7161b30e3a71fa0f320e86374425
vendor/lib64/libOpenCL.so|cd4a6c252068e74a34ff7a227e421bbe73892911
vendor/lib64/libadreno_utils.so|75eac3cf993fefa017588778c4fcd66f4ccf295b
vendor/lib64/libc2d30_bltlib.so|8c8fef67e346be907e1f9b312d11a1e9606ad6f0
vendor/lib64/libgpudataproducer.so|9391048f1da00fb290b0a0f1f9facf811c4023b3
vendor/lib64/libgsl.so|1cb105b527d41bdfd53ee6dccd39a31787f77e89
vendor/lib64/libhdr_tm.so|cfd5f03dd37b5b6fb46d288bed619b780ec7343e
vendor/lib64/libllvm-glnext.so|1a72aa1ce9820be7bde1bafcf19417d606445fb3
vendor/lib64/libmm-hdcpmgr.so|cb689116359eff2a0a8bc56e3f6a085cca60e428
vendor/lib64/libpvr.so|310828d47b0020ea7cb52eec68f16903fc1728be
vendor/lib64/libVkLayer_q3dtools.so|34227e82cd0a4a913dd8aaa369a21203e415c64c
etc/permissions/com.qti.snapdragon.sdk.display.xml|79a36c560f8cdbfeca03911fefc282bda25b2322
framework/com.qti.snapdragon.sdk.display.jar|657b74d0517f6438d3e0914f92f3b8de6d2a10a1
vendor/bin/hw/vendor.display.color@1.0-service|cc49cdccfe49348e8aff61ea6e43cc81c387904e
vendor/bin/mm-pp-dpps|23a548b67f5936135568fd8402bff8694d5d64b1
vendor/etc/init/vendor.display.color@1.0-service.rc|5ad673f879b3685a0e79b5633437e5499cb94f48
vendor/lib/libdisp-aba.so|219f6ec51d96f1647a6dcad1a8f9cf7bdca5bd26
vendor/lib/vendor.display.color@1.0.so|66a724a1a3cbca71edeec5c88957749ac0bf364a
vendor/lib/vendor.display.color@1.1.so|e70483684de53d819b45b6a69a0040dea6f9aedd
vendor/lib/vendor.display.color@1.2.so|a58c6c1a9d31b21a9d88d1b90c60eb10631c1fcb
vendor/lib/vendor.display.postproc@1.0.so|d1118b8db81ea80487afcc5383f79691c70aeb12
vendor/lib/vendor.qti.hardware.qdutils_disp@1.0.so|6f4660590fc76937d917139c4a8c360830dd8944
vendor/lib64/libdisp-aba.so|028a8fd7a633a082fa6b07d82be49357b65e95ac
vendor/lib64/vendor.display.color@1.0.so|b1db446a13b1598675a8f538fe1d18d3b08ef570
vendor/lib64/vendor.display.color@1.1.so|dd12242ccc66729458aa01b1960bff0a3f391d8a
vendor/lib64/vendor.display.color@1.2.so|9d8a103b13bbae99cc5513251b4f8f361eb17d6c
vendor/lib64/vendor.display.postproc@1.0.so|9d70df811e194e4dc6dce9a6a0c87cd74c507e9d
vendor/lib64/vendor.qti.hardware.qdutils_disp@1.0.so|3b9a0b71944c6b8d9a0b3a976a9ff09ba3864fb4
vendor/lib/libscalar.so|835649ab934f93d545059fd08040c6acbf7f3d1b
vendor/lib/libsdm-color.so|e83b9eae6f2c491deafd59de84bbfcee91435af4
vendor/lib/libsdm-diag.so|bb6f4aa490b47fc9a9bd52787cd2b3cc02334cd3
-vendor/lib/libsdm-disp-vndapis.so|41ad68d9f688f3e4c8bd2d891c1ece822af5ffd5
vendor/lib/libsdmextension.so|e5d4eb083711989f9592b3a73e61c61b43e7fc90
vendor/lib/libtinyxml2_1.so|78a92dd74248531bccd5c5d31fe0fa2984cad85c
vendor/lib64/libscalar.so|c47e029b8eabb8cedb1cea92f49d2c876106b326
vendor/lib64/libsdm-color.so|7caa3c7a3dfd0e0d5ab71c287bc142d1053df50b
vendor/lib64/libsdm-diag.so|ba86907e54afb2d72ea7fe8492adfb872b6de9e3
-vendor/lib64/libsdm-disp-vndapis.so|55f941f470b22f9661019740839b0524cdec979c
vendor/lib64/libsdmextension.so|7b7905b2bcd7fc784c280a2e7945c0e91f5ba118
vendor/lib64/libtinyxml2_1.so|92101861d95cbdf9625d192d0b2295baa5960b68'

remove_trash() { 
    sed 's/|.*//g; s/^-//g' <<< "$1";
}

push() {
    if [ ! -f "proprietary/$1" ]; then
        echo "(not found) File $1 was skipped."
        return
    fi

    adb push proprietary/$1 /$1 >/dev/null

    if [ "$?" != 0 ]; then
        echo "(failed to push) File $1 was skipped."
        return 0
    fi
}

for i in $proprietary_files_contents; do
    if [ -z "$i" ]; then
        continue
    fi

    clean="$(remove_trash $i)"
    push "$clean"
done

exit 0