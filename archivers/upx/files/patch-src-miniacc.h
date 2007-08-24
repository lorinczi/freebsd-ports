--- src/miniacc.h.orig	2007-08-24 04:34:35.884000000 +0000
+++ src/miniacc.h	2007-08-24 04:35:22.215000000 +0000
@@ -1302,7 +1302,7 @@
 #elif !defined(ACC_ABI_BIG_ENDIAN) && !defined(ACC_ABI_LITTLE_ENDIAN)
 #if (ACC_ARCH_ALPHA) && (ACC_ARCH_CRAY_MPP)
 #  define ACC_ABI_BIG_ENDIAN        1
-#elif (ACC_ARCH_ALPHA || ACC_ARCH_AMD64 || ACC_ARCH_BLACKFIN || ACC_ARCH_CRIS || ACC_ARCH_I086 || ACC_ARCH_I386 || ACC_ARCH_MSP430)
+#elif (ACC_ARCH_ALPHA || ACC_ARCH_AMD64 || ACC_ARCH_BLACKFIN || ACC_ARCH_CRIS || ACC_ARCH_I086 || ACC_ARCH_I386 || ACC_ARCH_MSP430 || ACC_ARCH_IA64)
 #  define ACC_ABI_LITTLE_ENDIAN     1
 #elif (ACC_ARCH_M68K || ACC_ARCH_S390)
 #  define ACC_ABI_BIG_ENDIAN        1
