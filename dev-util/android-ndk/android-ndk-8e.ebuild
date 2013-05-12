# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/android-ndk/android-ndk-5c.ebuild,v 1.1 2011/06/17 16:53:49 cardoe Exp $

EAPI=3

MY_P="${PN}-r${PV}"

DESCRIPTION="Open Handset Alliance's Android NDK (Native Dev Kit)"
HOMEPAGE="http://developer.android.com/sdk/ndk/"
SRC_URI="http://dl.google.com/android/ndk/${MY_P}-linux-x86_64.tar.bz2"

LICENSE="android"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip installsources test"

DEPEND=""
RDEPEND=">=dev-util/android-sdk-update-manager-10
	>=sys-devel/make-3.81"

S="${WORKDIR}/${MY_P}"

ANDROID_NDK_DIR="opt/${PN}"

ANDROID_TC_ANDROID_EABI="${ANDROID_NDK_DIR}/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-x86"
ANDROID_PLATFORM_3="${ANDROID_NDK_DIR}/platforms/android-3/arch-arm/usr/lib"
ANDROID_PLATFORM_4="${ANDROID_NDK_DIR}/platforms/android-4/arch-arm/usr/lib"
ANDROID_PLATFORM_5="${ANDROID_NDK_DIR}/platforms/android-5/arch-arm/usr/lib"
ANDROID_PLATFORM_8="${ANDROID_NDK_DIR}/platforms/android-8/arch-arm/usr/lib"
ANDROID_PLATFORM_9="${ANDROID_NDK_DIR}/platforms/android-9/arch-arm/usr/lib"
ANDROID_PLATFORM_14="${ANDROID_NDK_DIR}/platforms/android-14/arch-arm/usr/lib"
ANDROID_STLPORT="${ANDROID_NDK_DIR}/sources/cxx-stl/stlport/libs"

QA_TEXTRELS="
	${ANDROID_PLATFORM_3}/libthread_db.so
	${ANDROID_PLATFORM_3}/libdl.so
	${ANDROID_PLATFORM_3}/libc.so

	${ANDROID_PLATFORM_5}/libc.so

	${ANDROID_PLATFORM_8}/libdl.so
	${ANDROID_PLATFORM_8}/libc.so

	${ANDROID_PLATFORM_9}/libc.so
	${ANDROID_PLATFORM_14}/libc.so
"

QA_EXECSTACK="
	${ANDROID_NDK_DIR}/toolchains/arm-linux-androideabi-4.6/prebuilt/gdbserver


	${ANDROID_PLATFORM_3}/crtbegin_static.o
	${ANDROID_PLATFORM_3}/libm.a:isinf.o
	${ANDROID_PLATFORM_3}/libm.a:fpclassify.o
	${ANDROID_PLATFORM_3}/libm.a:b_exp.o
	${ANDROID_PLATFORM_3}/libm.a:b_log.o
	${ANDROID_PLATFORM_3}/libm.a:b_tgamma.o
	${ANDROID_PLATFORM_3}/libm.a:e_acos.o
	${ANDROID_PLATFORM_3}/libm.a:e_acosf.o
	${ANDROID_PLATFORM_3}/libm.a:e_acosh.o
	${ANDROID_PLATFORM_3}/libm.a:e_acoshf.o
	${ANDROID_PLATFORM_3}/libm.a:e_asin.o
	${ANDROID_PLATFORM_3}/libm.a:e_asinf.o
	${ANDROID_PLATFORM_3}/libm.a:e_atan2.o
	${ANDROID_PLATFORM_3}/libm.a:e_atan2f.o
	${ANDROID_PLATFORM_3}/libm.a:e_atanh.o
	${ANDROID_PLATFORM_3}/libm.a:e_atanhf.o
	${ANDROID_PLATFORM_3}/libm.a:e_cosh.o
	${ANDROID_PLATFORM_3}/libm.a:e_coshf.o
	${ANDROID_PLATFORM_3}/libm.a:e_exp.o
	${ANDROID_PLATFORM_3}/libm.a:e_expf.o
	${ANDROID_PLATFORM_3}/libm.a:e_fmod.o
	${ANDROID_PLATFORM_3}/libm.a:e_fmodf.o
	${ANDROID_PLATFORM_3}/libm.a:e_gamma.o
	${ANDROID_PLATFORM_3}/libm.a:e_gamma_r.o
	${ANDROID_PLATFORM_3}/libm.a:e_gammaf.o
	${ANDROID_PLATFORM_3}/libm.a:e_gammaf_r.o
	${ANDROID_PLATFORM_3}/libm.a:e_hypot.o
	${ANDROID_PLATFORM_3}/libm.a:e_hypotf.o
	${ANDROID_PLATFORM_3}/libm.a:e_j0.o
	${ANDROID_PLATFORM_3}/libm.a:e_j0f.o
	${ANDROID_PLATFORM_3}/libm.a:e_j1.o
	${ANDROID_PLATFORM_3}/libm.a:e_j1f.o
	${ANDROID_PLATFORM_3}/libm.a:e_jn.o
	${ANDROID_PLATFORM_3}/libm.a:e_jnf.o
	${ANDROID_PLATFORM_3}/libm.a:e_lgamma.o
	${ANDROID_PLATFORM_3}/libm.a:e_lgamma_r.o
	${ANDROID_PLATFORM_3}/libm.a:e_lgammaf.o
	${ANDROID_PLATFORM_3}/libm.a:e_lgammaf_r.o
	${ANDROID_PLATFORM_3}/libm.a:e_log.o
	${ANDROID_PLATFORM_3}/libm.a:e_log10.o
	${ANDROID_PLATFORM_3}/libm.a:e_log10f.o
	${ANDROID_PLATFORM_3}/libm.a:e_logf.o
	${ANDROID_PLATFORM_3}/libm.a:e_pow.o
	${ANDROID_PLATFORM_3}/libm.a:e_powf.o
	${ANDROID_PLATFORM_3}/libm.a:e_rem_pio2.o
	${ANDROID_PLATFORM_3}/libm.a:e_rem_pio2f.o
	${ANDROID_PLATFORM_3}/libm.a:e_remainder.o
	${ANDROID_PLATFORM_3}/libm.a:e_remainderf.o
	${ANDROID_PLATFORM_3}/libm.a:e_scalb.o
	${ANDROID_PLATFORM_3}/libm.a:e_scalbf.o
	${ANDROID_PLATFORM_3}/libm.a:e_sinh.o
	${ANDROID_PLATFORM_3}/libm.a:e_sinhf.o
	${ANDROID_PLATFORM_3}/libm.a:e_sqrt.o
	${ANDROID_PLATFORM_3}/libm.a:e_sqrtf.o
	${ANDROID_PLATFORM_3}/libm.a:k_cos.o
	${ANDROID_PLATFORM_3}/libm.a:k_cosf.o
	${ANDROID_PLATFORM_3}/libm.a:k_rem_pio2.o
	${ANDROID_PLATFORM_3}/libm.a:k_sin.o
	${ANDROID_PLATFORM_3}/libm.a:k_sinf.o
	${ANDROID_PLATFORM_3}/libm.a:k_tan.o
	${ANDROID_PLATFORM_3}/libm.a:k_tanf.o
	${ANDROID_PLATFORM_3}/libm.a:s_asinh.o
	${ANDROID_PLATFORM_3}/libm.a:s_asinhf.o
	${ANDROID_PLATFORM_3}/libm.a:s_atan.o
	${ANDROID_PLATFORM_3}/libm.a:s_atanf.o
	${ANDROID_PLATFORM_3}/libm.a:s_cbrt.o
	${ANDROID_PLATFORM_3}/libm.a:s_cbrtf.o
	${ANDROID_PLATFORM_3}/libm.a:s_ceil.o
	${ANDROID_PLATFORM_3}/libm.a:s_ceilf.o
	${ANDROID_PLATFORM_3}/libm.a:s_ceill.o
	${ANDROID_PLATFORM_3}/libm.a:s_copysign.o
	${ANDROID_PLATFORM_3}/libm.a:s_copysignf.o
	${ANDROID_PLATFORM_3}/libm.a:s_cos.o
	${ANDROID_PLATFORM_3}/libm.a:s_cosf.o
	${ANDROID_PLATFORM_3}/libm.a:s_erf.o
	${ANDROID_PLATFORM_3}/libm.a:s_erff.o
	${ANDROID_PLATFORM_3}/libm.a:s_exp2.o
	${ANDROID_PLATFORM_3}/libm.a:s_exp2f.o
	${ANDROID_PLATFORM_3}/libm.a:s_expm1.o
	${ANDROID_PLATFORM_3}/libm.a:s_expm1f.o
	${ANDROID_PLATFORM_3}/libm.a:s_fabsf.o
	${ANDROID_PLATFORM_3}/libm.a:s_fdim.o
	${ANDROID_PLATFORM_3}/libm.a:s_finite.o
	${ANDROID_PLATFORM_3}/libm.a:s_finitef.o
	${ANDROID_PLATFORM_3}/libm.a:s_floor.o
	${ANDROID_PLATFORM_3}/libm.a:s_floorf.o
	${ANDROID_PLATFORM_3}/libm.a:s_floorl.o
	${ANDROID_PLATFORM_3}/libm.a:s_fma.o
	${ANDROID_PLATFORM_3}/libm.a:s_fmaf.o
	${ANDROID_PLATFORM_3}/libm.a:s_fmax.o
	${ANDROID_PLATFORM_3}/libm.a:s_fmaxf.o
	${ANDROID_PLATFORM_3}/libm.a:s_fmaxl.o
	${ANDROID_PLATFORM_3}/libm.a:s_fmin.o
	${ANDROID_PLATFORM_3}/libm.a:s_fminf.o
	${ANDROID_PLATFORM_3}/libm.a:s_fminl.o
	${ANDROID_PLATFORM_3}/libm.a:s_frexpf.o
	${ANDROID_PLATFORM_3}/libm.a:s_ilogb.o
	${ANDROID_PLATFORM_3}/libm.a:s_ilogbf.o
	${ANDROID_PLATFORM_3}/libm.a:s_ilogbl.o
	${ANDROID_PLATFORM_3}/libm.a:s_isfinite.o
	${ANDROID_PLATFORM_3}/libm.a:s_isnormal.o
	${ANDROID_PLATFORM_3}/libm.a:s_llrint.o
	${ANDROID_PLATFORM_3}/libm.a:s_llrintf.o
	${ANDROID_PLATFORM_3}/libm.a:s_llround.o
	${ANDROID_PLATFORM_3}/libm.a:s_llroundf.o
	${ANDROID_PLATFORM_3}/libm.a:s_llroundl.o
	${ANDROID_PLATFORM_3}/libm.a:s_log1p.o
	${ANDROID_PLATFORM_3}/libm.a:s_log1pf.o
	${ANDROID_PLATFORM_3}/libm.a:s_logb.o
	${ANDROID_PLATFORM_3}/libm.a:s_logbf.o
	${ANDROID_PLATFORM_3}/libm.a:s_lrint.o
	${ANDROID_PLATFORM_3}/libm.a:s_lrintf.o
	${ANDROID_PLATFORM_3}/libm.a:s_lround.o
	${ANDROID_PLATFORM_3}/libm.a:s_lroundf.o
	${ANDROID_PLATFORM_3}/libm.a:s_lroundl.o
	${ANDROID_PLATFORM_3}/libm.a:s_modff.o
	${ANDROID_PLATFORM_3}/libm.a:s_nearbyint.o
	${ANDROID_PLATFORM_3}/libm.a:s_nextafter.o
	${ANDROID_PLATFORM_3}/libm.a:s_nextafterf.o
	${ANDROID_PLATFORM_3}/libm.a:s_nexttowardf.o
	${ANDROID_PLATFORM_3}/libm.a:s_remquo.o
	${ANDROID_PLATFORM_3}/libm.a:s_remquof.o
	${ANDROID_PLATFORM_3}/libm.a:s_rint.o
	${ANDROID_PLATFORM_3}/libm.a:s_rintf.o
	${ANDROID_PLATFORM_3}/libm.a:s_round.o
	${ANDROID_PLATFORM_3}/libm.a:s_roundf.o
	${ANDROID_PLATFORM_3}/libm.a:s_roundl.o
	${ANDROID_PLATFORM_3}/libm.a:s_signbit.o
	${ANDROID_PLATFORM_3}/libm.a:s_signgam.o
	${ANDROID_PLATFORM_3}/libm.a:s_significand.o
	${ANDROID_PLATFORM_3}/libm.a:s_significandf.o
	${ANDROID_PLATFORM_3}/libm.a:s_sin.o
	${ANDROID_PLATFORM_3}/libm.a:s_sinf.o
	${ANDROID_PLATFORM_3}/libm.a:s_tan.o
	${ANDROID_PLATFORM_3}/libm.a:s_tanf.o
	${ANDROID_PLATFORM_3}/libm.a:s_tanh.o
	${ANDROID_PLATFORM_3}/libm.a:s_tanhf.o
	${ANDROID_PLATFORM_3}/libm.a:s_trunc.o
	${ANDROID_PLATFORM_3}/libm.a:s_truncf.o
	${ANDROID_PLATFORM_3}/libm.a:s_truncl.o
	${ANDROID_PLATFORM_3}/libm.a:w_drem.o
	${ANDROID_PLATFORM_3}/libm.a:w_dremf.o
	${ANDROID_PLATFORM_3}/libm.a:s_copysignl.o
	${ANDROID_PLATFORM_3}/libm.a:s_fabsl.o
	${ANDROID_PLATFORM_3}/libm.a:s_fabs.o
	${ANDROID_PLATFORM_3}/libm.a:s_frexp.o
	${ANDROID_PLATFORM_3}/libm.a:s_isnan.o
	${ANDROID_PLATFORM_3}/libm.a:s_modf.o
	${ANDROID_PLATFORM_3}/libm.a:fenv.o
	${ANDROID_PLATFORM_3}/libm.a:e_ldexpf.o
	${ANDROID_PLATFORM_3}/libm.a:s_scalbln.o
	${ANDROID_PLATFORM_3}/libm.a:s_scalbn.o
	${ANDROID_PLATFORM_3}/libm.a:s_scalbnf.o
	${ANDROID_PLATFORM_3}/crtend_android.o
	${ANDROID_PLATFORM_3}/libstdc++.a:one_time_construction.o
	${ANDROID_PLATFORM_3}/libstdc++.a:new.o
	${ANDROID_PLATFORM_3}/libstdc++.a:pure_virtual.o
	${ANDROID_PLATFORM_3}/libstdc++.a:typeinfo.o
	${ANDROID_PLATFORM_3}/crtbegin_dynamic.o
	${ANDROID_PLATFORM_3}/libthread_db.a:libthread_db.o

	${ANDROID_PLATFORM_9}/crtend_so.o
	${ANDROID_PLATFORM_9}/crtbegin_so.o
	${ANDROID_PLATFORM_14}/crtend_so.o
	${ANDROID_PLATFORM_14}/crtbegin_so.o	
"

QA_DT_HASH="
	${ANDROID_PLATFORM_3}/libm.so
	${ANDROID_PLATFORM_3}/libthread_db.so
	${ANDROID_PLATFORM_3}/libstdc++.so
	${ANDROID_PLATFORM_3}/liblog.so
	${ANDROID_PLATFORM_3}/libdl.so
	${ANDROID_PLATFORM_3}/libz.so
	${ANDROID_PLATFORM_3}/libc.so

	${ANDROID_PLATFORM_4}/libGLESv1_CM.so

	${ANDROID_PLATFORM_5}/libGLESv2.so
	${ANDROID_PLATFORM_5}/libc.so

	${ANDROID_PLATFORM_8}/libjnigraphics.so
	${ANDROID_PLATFORM_8}/libdl.so
	${ANDROID_PLATFORM_8}/libc.so

	${ANDROID_PLATFORM_9}/libEGL.so
	${ANDROID_PLATFORM_9}/libandroid.so
	${ANDROID_PLATFORM_9}/libOpenSLES.so
	${ANDROID_PLATFORM_9}/libc.so

	${ANDROID_PLATFORM_14}/libEGL.so
	${ANDROID_PLATFORM_14}/libandroid.so
	${ANDROID_PLATFORM_14}/libOpenSLES.so
	${ANDROID_PLATFORM_14}/libc.so

	${ANDROID_STLPORT}/armeabi-v7a/libstlport_shared.so
	${ANDROID_STLPORT}/armeabi/libstlport_shared.so
"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	dodir "/${ANDROID_NDK_DIR}"
	cp -pPR * "${ED}/${ANDROID_NDK_DIR}"

	fowners -R root:android "/${ANDROID_NDK_DIR}"
	fperms 0775 "/${ANDROID_NDK_DIR}/"{,build,docs,platforms,samples}
	fperms 0775 "/${ANDROID_NDK_DIR}/"{sources,tests,toolchains}

	dodir "/${ANDROID_NDK_DIR}/out"
	fowners root:android "/${ANDROID_NDK_DIR}/out"
	fperms 3775 "/${ANDROID_NDK_DIR}/out"

	echo "PATH=\"${EPREFIX}/${ANDROID_NDK_DIR}:" \
		"${EPREFIX}/${ANDROID_TC_ARM_EABI}/bin/:" \
		"${EPREFIX}/${ANDROID_TC_ANDROID_EABI}/bin/\"" \
		> "${T}/80${PN}"  || die

	doenvd "${T}/80${PN}" || die

	echo "SEARCH_DIRS_MASK=\"${EPREFIX}/${ANDROID_NDK_DIR}\"" \
		> "${T}/80${PN}" || die
	insinto "/etc/revdep-rebuild"
	doins "${T}/80${PN}"
}
