# Created by: ijliao
# $FreeBSD$

PORTNAME=	libharu
DISTVERSIONPREFIX=	RELEASE_
DISTVERSION=	2_3_0
PORTREVISION=	1
CATEGORIES=	print

MAINTAINER=	jlaffaye@FreeBSD.org
COMMENT=	Haru Free PDF Library

LIB_DEPENDS=	libpng.so:graphics/png

OPTIONS_DEFINE=	EXAMPLES

USE_LDCONFIG=	yes
USES+=		cmake:outsource

USE_GITHUB=	yes

SOVERSION=	2
PLIST_SUB+=	SOVERSION=${SOVERSION}
PORTEXAMPLES=	*

EXAMPLES_CMAKE_ON=	-DLIBHPDF_EXAMPLES:BOOL=ON  \
			-DEXAMPLESDIR:STRING=share/examples/${PORTNAME}
post-install:
	${LN} -s libhpdf.so ${STAGEDIR}${PREFIX}/lib/libhpdf.so.${SOVERSION}

.include <bsd.port.mk>
