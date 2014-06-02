# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Functions
function disp() {
	xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync 
	xrandr --addmode VGA1 1920x1080_60.00
	xrandr --output VGA1 --mode 1920x1080_60.00 --right-of LVDS1 --primary
}

function startjboss() {
    cd $JBOSS4_HOME/bin
    ./run.sh
}

function startjboss_j() {
        cd $JBOSS4_HOME/bin
        ./run.sh  -DrunSingletonScheduler=true
}



function deploy() {
    echo "cleaning test..."
    rm $JBOSS4_HOME/server/st/deploy/paysol-*.ear
    rm $JBOSS4_HOME/server/st/deploy/paysol-*.jar
    rm -rf $JBOSS4_HOME/server/st/work/*
    rm -rf $JBOSS4_HOME/server/st/tmp/*
    echo "deploying to test..."
    pushd /home/sajith/work/paysol
    cp ./tests/ear/target/paysol-tests-ear-*-SNAPSHOT.ear $JBOSS4_HOME/server/st/deploy
    cp `find . -name paysol-security-*.jar | grep ./tests/ear/target/` $JBOSS4_HOME/server/st/deploy 
    popd
}

function fcreatedb() {

     if [ $# -ne 1 ]; then
        echo "usage fcreatedb <dbname>"
     else
	psql -Upostgres  -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='$1'"
        dropdb -Upostgres $1
        createdb -Upostgres $1 -Eutf-8
        psql -Upostgres $1 -c "CREATE SCHEMA audit AUTHORIZATION postgres;"
        psql -Upostgres $1 -c "CREATE SCHEMA onboarding AUTHORIZATION postgres;"
    fi
}

function fdropdb() {

    if [ $# -ne 1 ]; then
        echo "usage fdropdb <dbname>"
    else
	psql -Upostgres  -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='$1'"
        dropdb -Upostgres $1
    fi
}

function rcp() {
    pushd  ~/work
    rsync -zvru paysol 10.2.4.21:work --exclude .git --exclude target/* --delete
    popd
}

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

function wo {
    if [[ -z "$WORK_DIR" ]]; then
        echo -e "\e[2mWork dir not set"
    else
        if [[ ! -z "$1" ]]; then
            cd "$WORK_DIR/$1"
        else
            echo -e "\e[2m Enter a work dir"
        fi
    fi
}

function update_po_db() {
    cd /home/sajith/work/paysol/bootstrap/data/src/main/resources
    psql -Upostgres paysol -f updatePaysol.sql
    psql -Upostgres archive -f updateArchive.sql
}


function kp () {
    if [[ -z "$1" ]]; then
        echo "usage kp <processname>"
    else
        kill -9 `ps -ef | grep $1 | grep -v grep | cut -d " " -f5`
        kill -9 `ps -ef | grep $1 | grep -v grep | cut -d " " -f4`
    fi
}

function gp () {
    if [[ -z "$1" ]]; then
        echo "usage gp <processname>"
    else
        ps -ef |  grep -v grep | grep $1
    fi
}


function sd() {
lastcommand=`fc -nl | grep sd | tail -n 1 | cut -d ";" -f 1`
exitcode=$?
while :
do
    notify-send "Task you submitted is completed 
        Task name $lastcommand
        Exit code is - `if [ $exitcode = 0 ]; then echo Success; else echo Error; fi`"
    sleep 3
done
#notify-send "Task you submitted is completed 
#Exit code is - `if [ \$? = 0 ]; then echo Success; else echo Error; fi`"
#
}

#Alias
alias "cbld=mvn clean install -DskipTests"
alias "bld=mvn install -DskipTests"
alias "ut=mvn -Pfast.install"
alias "it=mvn -Prun-its -pl core/ejb/ejb-integration-test verify"
alias "st=mvn -Prun-its -pl tests/systemtest verify"
alias "rnet=sudo systemctl restart network.service"
alias "off=xrandr --output VGA1 --off"
alias "gf=git fetch"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias "resetmq=sudo rabbitmqctl stop_app;sudo rabbitmqctl reset;sudo rabbitmqctl start_app"
alias wget='wget -c'
alias dualmon="xrandr --output HDMI1 --left-of VGA1"
alias "htop_m=htop --sort-key=PERCENT_CPU"
alias "htop_c=htop --sort-key=PERCENT_MEM"
alias "initdhclient=sudo pkill -HUP dhclient;sudo dhclient"
alias "gmail=firefox www.gmail.com"
alias "ca=firefox https://www.google.com/calendar/render?tab=mc"
alias "cal=/usr/bin/cal -3"
alias "df=df -h"
alias "free=free -h"
alias "bootstrapst=mvn -Prun-its -pl tests/systemtest prepare-package -o"
alias "Eterm= Eterm --borderless --buttonbar 0 --trans --shade 0 --scrollbar false"
#Variables

#export JAVA_HOME=/home/sajith/apps/jdk1.7.0_25/
export JAVA_HOME=/home/sajith/apps/java8
#export M2_HOME=/home/sajith/apps/apache-maven-3.0.5
export M2_HOME=/home/sajith/apps/apache-maven-3.2.1
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
export JBOSS4_HOME=/home/sajith/apps/JBoss_42_GA
export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH
export WORK_DIR=/home/sajith/work

source /home/sajith/scratch/oh-my-git/prompt.sh
source /home/sajith/scratch/myconfigs/bashscripts/wo_autocomplete
source /home/sajith/scratch/myconfigs/bashscripts/kp_autocomplete

complete -F wo_options wo
complete -F kp_options kp

/usr/bin/setxkbmap -option 'ctrl:nocaps'
