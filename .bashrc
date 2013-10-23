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

#Alias
alias "cbld=mvn clean install -DskipTests"
alias "bld=mvn install -DskipTests"
alias "cst=fcreatedb paysolTest;mvn clean install -Psystemtest -f tests/systemtest/pom.xml"
alias "st=fcreatedb paysolTest;mvn install -Psystemtest -f tests/systemtest/pom.xml"
alias "rnet=sudo systemctl restart network.service"
alias "off=xrandr --output VGA1 --off"
#Variables

export JAVA_HOME=/home/sajith/apps/jdk1.7.0_21
export M2_HOME=/home/sajith/apps/apache-maven-3.0.5
export JBOSS4_HOME=/home/sajith/apps/JBoss_42_GA
export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH
