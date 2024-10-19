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
BZh91AY&SY�D�d  �_�EP���/nޮ����    P.���[wU<׆������G��G����4@b ѵ4bP	DD�Q���=!��     �КFFI�j  b    j$jhbi� h   �MOS)��I��4 ���  ���$AHі&�8�K�P��J�f�*�і�)�Jٌ��+��m�T���-�d�N8l�#!�y�\gi;���K�����_�l�o?g�
�y"�},)ts���Qu������%�[�{z�#��2͵���f2��L�:�ۯ��W�Q��
L�}%h#�i ���|c�c�pu��	�Z_d��~��*VƦc��-�x�uT�t%Q���N����+�B��B�E>������EBD���*�.�I
Ϻ廬�Z�Mx�cB�-�G,g[��(�	+lЕ�& ���C]�u;�����DH]BI����f�K�bE�+�۩��r6b��m��p������#����b�gO}Q�L���X�>aΒbj6�<� _t�N���\�A��$���ԉ�q�H1��tV#e�lL�.�eJ�9!�{uG����{m[��3�U�=��03 �Xw33c1dāA)\�߉@��d�a��d���de���3�[��#�U�a�
�.#A�',��ߕt|#�H�dX-�%�Ҏ���y�)E%�촠EJwX/"�r!�ϊ"�R�`�ɝ��;$����������0(�� �E�)�r���qX$��
�.�^�<��+��s��7�5q��@�yK�2bWY��ʂ�J��F���*9i�
�b�ݍ�n\%s��[TRQ'T��Ia(l�L0�y1���	���%L����"�!*���G&�1ao/5��� _S�]��BB]I�