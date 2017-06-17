#!/bin/bash
if [ "$1" = "" ]; then
    echo "Usage of languageInstaller.sh"
    echo "./languageInstaller.sh <language> <ptm|cont (only de)>"
    echo "Go to https://github.com/Skills-And-Translations/Info-and-base/wiki/de.zip for more info"
    exit
fi
mkdir -p /tmp/languageInstallerStuff
cd /tmp/languageInstallerStuff
sudo apt install pocketsphinx python-pocketsphinx pocketsphinx-en-us
if [ "$1" = "de" ]; then
    if [ "$2" = "" ]; then
        echo "Your second argument should be ptm or cont. It is not set yet."
        echo "Whats better or bader, i couldn't recommend really. Just try out, both should working."
        exit 2
    fi
    if [ "$2" = "cont" ]; then
        wget http://goofy.zamia.org/voxforge/de/cmusphinx-cont-voxforge-de-r20170420.tar.xz
        tar xvfJ cmusphinx-cont-voxforge-de-r20170420.tar.xz
        id -u pi
        if [ "$?" = "0" ]; then
            echo "Got pi-user, seems to be pi"
            sudo mkdir -p /usr/share/pocketsphinx/model/hmm/de
            sudo cp -R cmusphinx-cont-voxforge-de-r20170420/model_parameters/voxforge.cd_cont_6000/* /usr/share/pocketsphinx/model/hmm/de/
            sudo mkdir -p /usr/share/pocketsphinx/model/lm/de
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.dic /usr/share/pocketsphinx/model/lm/de/
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.lm.bin /usr/share/pocketsphinx/model/lm/de/
            sudo chown mycroft:mycroft -R /usr/share/pocketsphinx/model/
            
            sudo mkdir -p  /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/hmm
            sudo cp -R cmusphinx-cont-voxforge-de-r20170420/model_parameters/voxforge.cd_cont_6000/* /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/hmm/
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.dic /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.lm.bin /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/
            sudo chown mycroft:mycroft -R /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de
        fi
        if [ "$?" = "1" ]; then
            echo "No pi-user, seems to be NOT a pi"
            sudo mkdir -p /usr/share/pocketsphinx/model/de/de
            sudo cp -R cmusphinx-cont-voxforge-de-r20170420/model_parameters/voxforge.cd_cont_6000/* /usr/share/pocketsphinx/model/de/de
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.dic /usr/share/pocketsphinx/model/de/
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.lm.bin /usr/share/pocketsphinx/model/de/
            sudo chown $(whoami):$(whoami) -R /usr/share/pocketsphinx/model/
            
            sudo mkdir -p  ~/mycroft_core/mycroft/client/speech/model/de/hmm
            sudo cp -R cmusphinx-cont-voxforge-de-r20170420/model_parameters/voxforge.cd_cont_6000/* ~/mycroft_core/mycroft/client/speech/model/de/hmm/
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.dic ~/mycroft_core/mycroft/client/speech/model/de/
            sudo cp cmusphinx-cont-voxforge-de-r20170420/etc/voxforge.lm.bin ~/mycroft_core/mycroft/client/speech/model/de/
            sudo chown $(whoami):$(whoami) -R ~/mycroft_core/mycroft/client/speech/model/de
        fi
        
    fi

    if [ "$2" = "ptm" ]; then
        wget http://goofy.zamia.org/voxforge/de/cmusphinx-ptm-voxforge-de-r20170420.tar.xz
        tar xvfJ cmusphinx-ptm-voxforge-de-r20170420.tar.xz
                id -u pi
        if [ "$?" = "0" ]; then
            echo "Got pi-user, seems to be pi"
            sudo mkdir -p /usr/share/pocketsphinx/model/hmm/de
            sudo cp -R cmusphinx-ptm-voxforge-de-r20170420/model_parameters/voxforge.cd_ptm_5000/* /usr/share/pocketsphinx/model/hmm/de/
            sudo mkdir -p /usr/share/pocketsphinx/model/lm/de
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.dic /usr/share/pocketsphinx/model/lm/de/
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.lm.bin /usr/share/pocketsphinx/model/lm/de/
            sudo chown mycroft:mycroft -R /usr/share/pocketsphinx/model/
            
            sudo mkdir -p  /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/hmm
            sudo cp -R cmusphinx-ptm-voxforge-de-r20170420/model_parameters/voxforge.cd_ptm_5000/* /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/hmm/
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.dic /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.lm.bin /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de/
            sudo chown mycroft:mycroft -R /usr/local/lib/python2.7/site-packages/mycroft_core-0.8.16-py2.7.egg/mycroft/client/speech/model/de
        fi
        if [ "$?" = "1" ]; then
            echo "No pi-user, seems to be NOT a pi"
            sudo mkdir -p /usr/share/pocketsphinx/model/de/de
            sudo cp -R cmusphinx-ptm-voxforge-de-r20170420/model_parameters/voxforge.cd_ptm_5000/* /usr/share/pocketsphinx/model/de/de
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.dic /usr/share/pocketsphinx/model/de/
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.lm.bin /usr/share/pocketsphinx/model/de/
            sudo chown $(whoami):$(whoami) -R /usr/share/pocketsphinx/model/
            
            sudo mkdir -p  ~/mycroft_core/mycroft/client/speech/model/de/hmm
            sudo cp -R cmusphinx-ptm-voxforge-de-r20170420/model_parameters/voxforge.cd_ptm_5000/* ~/mycroft_core/mycroft/client/speech/model/de/hmm/
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.dic ~/mycroft_core/mycroft/client/speech/model/de/
            sudo cp cmusphinx-ptm-voxforge-de-r20170420/etc/voxforge.lm.bin ~/mycroft_core/mycroft/client/speech/model/de/
            sudo chown $(whoami):$(whoami) -R ~/mycroft_core/mycroft/client/speech/model/de
        fi
        
    fi
    echo "You should now update your config like descripted in https://github.com/Skills-And-Translations/Info-and-base/wiki/de.zip"
fi

if [ "$1" = "es" ]; then
    wget https://downloads.sourceforge.net/project/cmusphinx/Acoustic%20and%20Language%20Models/Spanish/es-20k.lm.gz?r=&ts=1497725991&use_mirror=kent
    tar -xzf es-20k.lm.gz
    sudo mkdir -p /usr/share/pocketsphinx/model/es/es

fi 
