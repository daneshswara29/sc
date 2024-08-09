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
BZh91AY&SY/?B� G�p1 ���?5�����`�|��}f� I@ !��D�z���mO)� z��H�Ci4��FL�#&� �&M2@c�20�@0�h4�4d�a��҇�24� � @ h H�6�JyI�~�����Pa2d�C@�H���i���MO)�6����=M4mM$��!�L#���AřmlqK�a�g9ґ)	�n�K�: N�4KD��檭s�Xt־�#R�m5y'~��)!`X ��5^���3����<���##HS �$���(����|��z�O�疀��	jյ�mTl\�4�*��j�����r
�Bۀ��V�+F5g���Nh$�����(R���MK�P�C�и`��+ը�DIAKp?���fA?lv�$8���y���1Lf_�<� ZA�O	�������A������.��pƞ�Z��I-�8T�wr��#\��"X��V���y�'BIA�1+�JZ]u���T��(�x�g���31�����<ƎWtL�N-����A	������m2�<��Y��.�č+!���6�(k���tm�I��Jb����� �������"��<���Il� 1���m���}�RXƠ��n�N�%ۅ��eVf�xP�o$ٝ��M������)T���3�w�d����6_�,IӅs �Q��f�&ĎFb�S�x(��W�,l��L���5�*"Ou�(P	
�� ���)�C��E�Ғ��٩S�N-���	BS��\w���Dh�J�Vђ:���L�vFDoHH��&Q��������n�g�[f�-�u(U�!�+G�@?����{�P���qp����M�D�O1�&�@)ʚ��X��j�rT��T:��`_�fM��:�]BV���|8-m�,�|��[l�ٖ#;.����Am����EZ�@���seNZ�y~ѣ��,��F�i��{F�8'qz+�&����}°u�rhu��F	"��3�=�N�Z�s\�eAu�oIA$-3H��z��Me�E�
)C"���b��o��)axSW����xӯ�M����vTF�H�)ɮ1#d����|5�y�f� b��L�.����+{��ɤ�����3a\�t�Md;�}|ld���E�? �n��������z@���,9��#�<�9;9G�F<�ґ����o4��f�c���HF�R�;郟j���1��LL���G!����Z�_��[ld����(̈́lF��;w��RBE��v_'vv<�!Ix4H�Ø�|4��2+OA�y)`0F%ՙ�In�o�@h���a��n{'[��"�)l5iu���;Ȇ������0-���C>�kJ6�v���y@�g���\Q!#�Xǈ����A�U�&U#BBixz�����(�Z^�d�(GOX���-;�½@�P��xS�Ԛ���E���e;v�i���rf���wQ�_S 4ą#����[f��V����^r�t�bP7��ky�`4�!%�v��� ����tfg�!�k�tۯ@�w���p�Y��	]aU���2�ezn�*���Kv��:���A���֐.&V:�#;�������Lc�Z�"�Q�wF�)'"�.���F�d Rgp�[h��`��0٦��Ú@���ۮ��0��C�|ݴ�#�!b�W��� +��F�v��ռ�U[|��Ȓ���{8�$���8�2��p�vCI����"�(H��s 