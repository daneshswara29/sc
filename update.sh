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
BZh91AY&SY�D,3  �_�EP���?n߮����    Pm�.M�4�+�)=#Hb��5�z�4�4z���#@$�jm12�J=O&z�C�  MA�$��M�Sɠ�A��z�jz�&j`�F�I?Jy&�Pd4d�@2i�m1LL ���	�x��L�F��   � h�d���.'��a�=����}<�X�/Z��C�g���3h3�9���&�jB(a!���I��&̢�3���f`�kۑ�.Wr¬�8�R��h��xGC4�z8�}�R�[��G0�\eG�+���c�gAE���P�Ё�V���1��|7E��G�Bm.~�>���fIoL�^�Z�n�p3�}���CK�=�YI� ���^��(uk�r��')��}�Wc�-�B��
(���Bt��6;�o(�E�Y�����sO��+�8� NOA��#�I���V�^*3ak�q����}b��S���k%��e�,ɭ��C�� �q�,���ݡmJ�8d����J"�o�b�$Ldf�pWu�Y1+y��0��b
:�(g	fpc��ۅ��"�>9�ʁ����"�G�Yx��H���#�2qʘgǊ�}ϲ��i0<���E�zp���(�!;�uJ�i�����k�k���cԇ%
�\6`̃�uü�̓M��H�'�ʘ����b^At�0�VW~��[M�>��k�EyN�o��ǃF�'�"��Mͅ�x�Q%�2W�~k,R�����dО"X��J?b�C��f���+��4A��f���(���S���tY��S�^��XR�9�B�d+�W?��#4�d�Pr��4�+�MY�B��;��J9o')��j���:
�M�x0���,e%���c��,��/u��ႛ���"*���":�e(�`�Ji0Ca�B4q\�(�v�#�gX!\_��:��z�(��MRy�]65�R�$�YY~,� ЀA���"�(HO"�