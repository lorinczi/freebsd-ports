# Created by: Jason Bacon <bacon4000@gmail.com>
# $FreeBSD$

PORTNAME=	bwa
PORTVERSION=	0.7.17
DISTVERSIONPREFIX=v
CATEGORIES=	biology

MAINTAINER=	bacon4000@gmail.com
COMMENT=	Burrows-Wheeler sequence aligner

LICENSE=	GPLv3

# From 0.7.9a: Recheck for 0.7.17.
BROKEN_aarch64=		fails to compile: invalid conversion between vector type and integer type
BROKEN_armv6=		fails to compile: invalid conversion between vector type and integer type
BROKEN_mips=		fails to compile: cc1: unrecognized command line option "-msse2"
BROKEN_mips64=		fails to compile: cc1: unrecognized command line option "-msse2"
BROKEN_powerpc64=	fails to compile: ksw.c: emmintrin.h: No such file or directory

USES=		gmake perl5 shebangfix tar:bzip2
SHEBANG_FILES=	qualfa2fq.pl xa2multi.pl
USE_PERL5=	run

USE_GITHUB=	yes
GH_ACCOUNT=	lh3

PLIST_FILES=	bin/bwa bin/qualfa2fq.pl bin/xa2multi.pl man/man1/bwa.1.gz

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64 || ${ARCH} == i386
# Avoid #error in emmintrin.h
CFLAGS+=	-msse2
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bwa ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/*.pl ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/*.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include <bsd.port.post.mk>
