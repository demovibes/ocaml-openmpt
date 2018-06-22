# Copyright 2018 The Demovibes team
#
# $Id$

# check for one particular file of the sources 
AC_INIT([ocaml-openmpt],[0.1.0],[kennedy.greg@gmail.com])

VERSION=$PACKAGE_VERSION
AC_MSG_RESULT(configuring $PACKAGE_STRING)

AC_BASE_CHECKS()

# Use pkg-config
PKG_PROG_PKG_CONFIG()
if ! test -n "$PKG_CONFIG"; then
  PKG_CONFIG="/bin/false"
fi

# PKG_CHECK_MODULES to look for openmpt library
PKG_CHECK_MODULES([OPENMPT], [openmpt])

# substitutions to perform
AC_SUBST(VERSION)

# Finally create the Makefile and samples
AC_CONFIG_FILES([Makefile],[chmod a-w Makefile])
AC_CONFIG_FILES([src/Makefile],[chmod a-w src/Makefile])
AC_CONFIG_FILES([src/META])
AC_OUTPUT
