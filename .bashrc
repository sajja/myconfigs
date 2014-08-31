# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Functions
source /home/sajith/scratch/myconfigs/bashscripts/my_functions


#Alias
source /home/sajith/scratch/myconfigs/bashscripts/my_aliases
#alias "cbld=mvn clean install -DskipTests"
#alias "bld=mvn install -DskipTests"
#alias "ut=mvn -Pfast.install"
#alias "it=mvn -Prun-its -pl core/ejb/ejb-integration-test verify"
##alias "st=mvn -Prun-its -pl tests/systemtest verify"
#alias "rnet=sudo systemctl restart network.service"
#alias "off=xrandr --output VGA1 --off"
#alias "gf=git fetch"
#alias ..="cd .."
#alias ..2="cd ../.."
#alias ..3="cd ../../.."
#alias ..4="cd ../../../.."
#alias ..5="cd ../../../../.."
##alias "resetmq=sudo rabbitmqctl stop_app;sudo rabbitmqctl reset;sudo rabbitmqctl start_app"
#alias wget='wget -c'
#alias dualmon="xrandr --output HDMI1 --left-of VGA1"
#alias "htop_m=htop --sort-key=PERCENT_CPU"
#alias "htop_c=htop --sort-key=PERCENT_MEM"
#alias "initdhclient=sudo pkill -HUP dhclient;sudo dhclient"
#alias "gmail=firefox www.gmail.com"
#alias "ca=firefox https://www.google.com/calendar/render?tab=mc"
#alias "cal=/usr/bin/cal -3"
#alias "df=df -h"
#alias "free=free -h"
#alias "bootstrapst=mvn -Prun-its -pl tests/systemtest prepare-package -o"
#alias "Eterm= Eterm --borderless --buttonbar 0 --trans --shade 0 --scrollbar false"
#alias "shut=sudo shutdown -P now"
#alias "cless=less -R"
#Variables

export JAVA_HOME=/usr/java/jdk1.8.0_05
export M2_HOME=/home/sajith/apps/apache-maven-3.2.2
export JBOSS4_HOME=/home/sajith/apps/jboss-4.2.1GA

export WORK_DIR=/home/sajith/work

export TEXTTEST_INSTALL_DIR=/home/sajith/apps/texttest-3.26
export TEXTTEST_HOME=/home/sajith/texttest/
export TEXTTEST_PERSONAL_CONFIG=~/.texttest
export SOURCES_ROOT=~/work

export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$TEXTTEST_INSTALL_DIR/source/bin:$PATH

source /home/sajith/scratch/oh-my-git/prompt.sh
source /home/sajith/scratch/myconfigs/bashscripts/wo_autocomplete
source /home/sajith/scratch/myconfigs/bashscripts/kp_autocomplete

complete -F wo_options wo
complete -F kp_options kp

/usr/bin/setxkbmap -option 'ctrl:nocaps'

#SPELL CHECKER
shopt -s cdspell
fortune -a | cowsay
