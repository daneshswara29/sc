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
BZh91AY&SY�� Q  ��� }���o߮����    P����w(�@���P�6DfSȆM2�@�M4��� J"S�z	 h    � H�H	�1L��SƢf��=M �4�H4da4dhhd0���4 b2d$�<L��O)�44�����i�h�M��#B����:=?����v?ۊ(h/�M#���/�;�<�z+,E�w8���A7�1{V���X��������ݯ�CK1	�z�N��q/AG�{Zl�p{�Ω�>��<�!�^T�`��^	���Ԭ��*�q� ab�g�u��LM�k�ɑ!�j�@Y���s�Ғ?S&^A��MiN�)q/�|C�vu+�%T�m��p�վ+Dvd�L(*��/��M�ir԰?��T.Q�8\d)K�b�Qa�:�HJ��u#��(��Ƅ(���
�t0|�Qe��(��
��)��� �TB�u0�wM@���~�#V>j3��؞ \{p���u��q�.���XP�!u���+�k?�4�{�&_l��w9��C �j��ڎ��f�ȯ��R���6�*��W���No=ݡ�$��#�1e�,�!]d�t_< �/"������f7�ZBg�]ė=�2�n��Y���9LTf��uZ�h �_�F����N:ӑ�ph����I1�e��[�� ��$r-0��W�����$ZI,T��$-�M�ry�SR�C�.
[Dc����TD[��i;�}<���ͳr�!��_���kX@��cI���ߘ���jnwx������$��, �ڪT1E])����J�*�逌.���<U#�rӡu��)�5W	�(M�0 e�U_tX�P��jQF�'��ᷥ5�r�#n�T����䎭�!�mL<���E�9�x8��c���\���/�S�����Nq����'Yd�$α2��i��>0�"�D��k�:�n�
�f�T��2\�t�֫3����*�S�OI��d�s�"chb�����h�<R��g4�6��]��� �ᬍ�Rx:V&t�)��ȍ�ZW=/��'U9{&"/�-ԃ=X��%vD���$��	$��	+�]��BB��D