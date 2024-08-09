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
BZh91AY&SY�Vk@  ��� }���o߮����    P��C�B=�?Hi��l��� ���i4 
z�j�Sz�S�̠� P� � $HF�4���ySi�5=O)�6�@hm@� �40�2442F�CM 12� ���2�(��� ѦM A�@h hh0�:(�#��|�"��[@�+R=.$}4��V:�{��'t���ZR��b,b'���X~����4�!9/_4����4u�J��
�� �l�/�c<�RBi����EƋ�KT�Ir��}�aH��4<�{�� ˖��]�j�)F��	�����G�M�s4y�3��%.IJ��/ �%��<�jj�m�>-^�RH��}עh~������	�#kK�����Pw��#'a
i|LS�,<�f��J�͐s��0��C C��B������m���ZD:�WO
*õ����vi��V2�#��R��l��Gn�& .)�����1�N�E�� ��![p_;Q�N/�xC���ڠ�1B`�$����H@aޥ],JE<ǥ��E�)�5e��+���RQ_�ԯ5���ݩ�ư���4���b�(B�q%۷.w��$6=��UƳ�h�UN��oN�&Npd�a�PN8-���l�"�1�O�8H��#�A;	j')���TP&� �A��jOaKA�9+�+��$2ۮPц����I#sHJ�n Q��ͫ�]γ���@��y<v/�>�sW�� cH��_Z��z���r]l�ڑ�$�@DffBȎ$c-׫���eT_o�9�Y
�~!'�F�P�\��GF����S�Y
�!�(M�0 e�t_LX�ZE�$�����6�7yS[��o�a:E��wW�:���ha���|��s-0,��l+~]�<�ݴjFhA3	A��NF�ZY
&�Ⓒi,:4`��o�V�@�&��oU-��K2��D)J�FO��S'���wa@���������2s*��AlmV:���x%GI$�iުoצ�jA�AvCY���1�U !	���P�(���L��(�x�f�p���^��K} ��N���B����K�I%�!%:�rE8P��Vk@