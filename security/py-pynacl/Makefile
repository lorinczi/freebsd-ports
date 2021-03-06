# Created by: Yuri Victorovich <yuri@rawbw.com>
# $FreeBSD$

PORTNAME=	pynacl
DISTVERSION=	1.2.0
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyNaCl-${PORTVERSION}

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	PyNaCl is a Python binding to the Networking and Cryptography library

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.4.1:devel/py-cffi
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=1.4.1:devel/py-cffi \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=3.2.1:devel/py-pytest \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=1.11.4:devel/py-hypothesis

USES=		python localbase
USE_PYTHON=	autoplist distutils

OPTIONS_DEFINE=	BUNDLED_NACL
BUNDLED_NACL_DESC=	Use bundled NaCl version
BUNDLED_NACL_LIB_DEPENDS_OFF=	libsodium.so:security/libsodium
BUNDLED_NACL_MAKE_ENV_OFF=	SODIUM_INSTALL=system

post-install:
	${STRIP_CMD} ${STAGEDIR}${PYTHONPREFIX_SITELIBDIR}/nacl/_sodium.so

do-test:
	@cd ${WRKSRC} && ${SETENV} PYTHONPATH=${STAGEDIR}${PYTHONPREFIX_SITELIBDIR} ${PYTHON_CMD} -m pytest -rs tests

.include <bsd.port.mk>
