dnl lines starting with "dnl" are comments

PHP_ARG_ENABLE(orangr, whether to enable Orangr extension, [  --enable-orangr   Enable Orangr extension])

if test "$PHP_ORANGR" != "no"; then

  dnl this defines the extension
  PHP_NEW_EXTENSION(orangr, php_orangr.c, $ext_shared)

  dnl this is boilerplate to make the extension work on OS X
  case $build_os in
  darwin1*.*.*)
    AC_MSG_CHECKING([whether to compile for recent osx architectures])
    CFLAGS="$CFLAGS -arch i386 -arch x86_64 -mmacosx-version-min=10.5"
    AC_MSG_RESULT([yes])
    ;;
  darwin*)
    AC_MSG_CHECKING([whether to compile for every osx architecture ever])
    CFLAGS="$CFLAGS -arch i386 -arch x86_64 -arch ppc -arch ppc64"
    AC_MSG_RESULT([yes])
    ;;
  esac

fi
