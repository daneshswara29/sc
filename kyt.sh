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
BZh91AY&SYNi�  ��� }���oޮ����    P����f�خ��d�!OF��'� e42d��S��z���z�6���b � �   �4�L��%?I��<��d�z��h�hPhd�dɣ@h����`MbF� 0I%3D��I��d�@4�  ���e�.�n�Կz:����N��ɘܝ�����{}.a2�Y��G��$����z/+ox�1���V�; �4�!:/_	߳,� h��Sm"�{`�|�T��4*l��
�4��`W%1��[n�ti����S�hǦɗk�c�n�%�'2�ke��W�{?�}L�$J�f�2h��'��Ҟ�)b_."�[�ܳR�U�ݵ��ߊ�ϩ�`�C���h�?p����.�����8�Q�p���/#�K�d�ҕ+d<��P�)��ňR�r�B0�`v�N]V!ɉ��"��^��G��׍���n���@�l\s��f�<���f:�݈T5Y�DI�a�bp�0�b'�!���/b@�Esu`R�t!�Q���g�  Q�6r��a�m�U�W����[�9�O�E�1��5�OG��*d�C��K3�B2\�݂�Kղ��<�����Z-D��ˣ#h��2�Be,��c[QN_�������Xd(�L��8�ٖ��	ؒ"r�PCb4�ǥ0��h�%C�R�(mSOG����k��Qc��3jQ}�i�5I;�����N���k��܁5Cy��F��sX@� cH�!�rh8�%*�W��8�`�����
UP�SD1����-�=,�/��>|����G��Ðp.�{h����R`�\�Bn�.��y���*��_R�9�@]G7��k~�� ��,f�S����������0��ǅ�x��l�����U�fu"��1 :B.!9ƐFjL��G��mN�Ē�a0�p8"�Eťgﺍ���T*S2#'�.�iL�ˡ�x_P��W�Bx�M=#&K;�@�C�M�䌆v<R��g�pV7l�^U@�*P�>��FB婍M���z�
	!���*0�圧���BA�JMŬ�oK�H5-��y �pOR�D�_�K�HHJ����)�sK��