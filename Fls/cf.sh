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
BZh91AY&SY�#��  ���0 @}��{���~����P��=�EV�RI=Sɩ��Q�b6���	� 	����@h0�#LL��#@�L�T�=F���  ��   P�(�h
x�"4��@�� A��m��S��Ѧ�i� i���Ԥ��C	)5�D��A�#V`�o�5z��(�A�$���a��ۮP��I/~
���8���fV�$��S�	�������b����S��1�	���`��Җ��7�/v+��Stܖ3��"�4@�����a
��'(B�������19̉�$np9@�[n�ʂ.��A�m����]�]�g���R�ʺ�3.!�⺊�ʺRJ�' b��� XaY�8�Uť-�jnr��ۗ�)ǶE��%˙v��Z"n�/��N+���]<	��:�<g�r�X/�J3�\`T�#OwQ%��F(��c�O�_:�`��K�a1��qa��a)7��݊�.5�)&�H,��z,cES���4�V��s-�d��H-u��xP�	�����;����2���f���}�avFe�z�ݻ����K��ζ�������:�s�!5��m��Így,�*�\���: �h�l�n4��g�]�ZO��)!���j,R��K����Ga��*��j�m��-y�[�	����f]�wǜ"��)�]V�^
��g�e��b�k�qB{h i\���� Y;�#+�RQ�J����啀I��-��ZSȰզ#}px5��]U!�w�,W@m�,��;��J�$pP1^��b��B���0D��d�Jek�=s�Zi���բ�����S�L��������Գ�;���Զ�+��p5d����G
��k����]��������	�2Ä3s�]��BB�n�