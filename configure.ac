# $Id$

# check for one particular file of the sources 
AC_INIT([ocaml-libopenmpt],[0.1.0],[kennedy.greg@gmail.com])

VERSION=$PACKAGE_VERSION
AC_MSG_RESULT(configuring $PACKAGE_STRING)

AC_BASE_CHECKS()

# Use pkg-config
PKG_PROG_PKG_CONFIG()
# PKG_CONFIG_CHECK_MODULE to look for libopenmpt library
PKG_CONFIG_CHECK_MODULE([libopenmpt])

# substitutions to perform
AC_SUBST(VERSION)

# Finally create the Makefile and samples
AC_CONFIG_FILES([Makefile],[chmod a-w Makefile])
AC_CONFIG_FILES([src/META],[chmod a-w src/META])
AC_CONFIG_FILES([src/Makefile],[chmod a-w src/Makefile])
AC_CONFIG_FILES([examples/Makefile],[chmod a-w examples/Makefile])
AC_OUTPUT
