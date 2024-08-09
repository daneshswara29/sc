#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�KM�  =߀ }�3 � >���@ݡTA� b4��)���4�d   ��d �C 0*I�I�4�ЙSj���?Vl�S����R�y�?���UT�@'�0�`�%U�,���Pk�
Bc�Q��ٕԪ*�yV�Z�$�.ƪ���1����iCh��Å�Ì:��x�;�|d���%�?����:n�'2m7r�댯0���9݂&�X��=�UU_�PX�~�3�_�5���1�d�I�cd�*������(�0��g�EK��-~��l�F�;-[��wkYFw�%��ԪU*�E)���5��M\$���<0<��f�bl�u�і��6�����p�75����i����]'A�`0��{��w$S�	T��0