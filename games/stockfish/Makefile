# Created by: Gautam Mani <execve@gmail.com>
# $FreeBSD$

PORTNAME=	stockfish
PORTVERSION=	8
CATEGORIES=	games
MASTER_SITES=	http://stockfish.s3.amazonaws.com/:src
DISTNAME=	${PORTNAME}-${PORTVERSION}-src
DISTFILES=	${PORTNAME}-${PORTVERSION}-src.zip:src

MAINTAINER=	execve@gmail.com
COMMENT=	Open source chess engine

LICENSE=	GPLv3

NOT_FOR_ARCHS=	sparc64
BROKEN_aarch64=	Fails to build: cannot detect architecture
BROKEN_armv6=	Fails to configure: config-sanity: Error 1
BROKEN_mips64=	Fails to build: cannot detect architecture

USES=		compiler gmake zip

WRKSRC=		${WRKDIR}/${DISTNAME}/src
MYARCH=		${ARCH}
MYCC=		${COMPILER_TYPE}
TGTBLD=		build

PLIST_FILES=	bin/stockfish
PORTDATA=
PORTDOCS=	Readme.md

OPTIONS_DEFINE=	DOCS POPCNT

POPCNT_DESC=	Use the POPCNT instruction

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MPOPCNT} && ${ARCH} != amd64
BROKEN=		POPCNT compiles only on amd64
.endif

# workaround the ARCH usage in the stockfish Makefile
.if ${ARCH} == "i386"
MYARCH=		x86-32
.elif ${ARCH} == "amd64"
.  if ${PORT_OPTIONS:MPOPCNT}
MYARCH=		x86-64-modern
.  else
MYARCH=		x86-64
.  endif
.elif ${ARCH} == powerpc
MYARCH=		ppc-32
.elif ${ARCH} == powerpc64
MYARCH=		ppc-64
.endif

ALL_TARGET=	${TGTBLD} ARCH=${MYARCH} COMP=${MYCC}

post-patch:
	@${REINPLACE_CMD} -e "s/^PREFIX =/PREFIX ?=/" ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/stockfish ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/Readme.md ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
