# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Functions
source /home/sajith/scratch/myconfigs/bashscripts/my_functions


#Alias
source /home/sajith/scratch/myconfigs/bashscripts/my_aliases

#Variables
export JAVA_HOME=/usr/java/jdk1.8.0_45/
export M2_HOME=/home/sajith/tools/apache-maven-3.3.3
export JBOSS4_HOME=/home/sajith/apps/jboss-4.2.1GA

#WORK ON
export WORK_DIR=/home/sajith/work

#NOTES
export NOTE_PATH=/home/sajith/Dropbox/Documents/gnote

#TEXT_TEST
export TEXTTEST_INSTALL_DIR=/home/sajith/apps/TextTest-3.27.1
#export TEXTTEST_INSTALL_DIR=/home/sajith/apps/texttest-3.26
export TEXTTEST_HOME=/home/sajith/texttest/
export TEXTTEST_PERSONAL_CONFIG=~/.texttest
export SOURCE_ROOT=~/work
export GOROOT=/usr/lib/golang/bin/linux_amd64/
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/scratch
export PATH=/home/sajith/tools/sbt/bin:$JAVA_HOME/bin:$M2_HOME/bin:$TEXTTEST_INSTALL_DIR/bin:/home/sajith/apps/scala-2.10.4/bin/:/home/sajith/.local/bin:/home/sajith/tools/scala-2.11.6/bin:$PATH

source /home/sajith/scratch/oh-my-git/prompt.sh
source /home/sajith/scratch/myconfigs/bashscripts/wo_autocomplete
source /home/sajith/scratch/myconfigs/bashscripts/kp_autocomplete
source /home/sajith/scratch/myconfigs/bashscripts/mm_autocomplete

complete -F wo_options wo
complete -F kp_options kp
complete -F mm_options mm 

#Disable CAPS
#/usr/bin/setxkbmap -option 'ctrl:nocaps'

complete -cf sudo
#unset PROMPT_COMMAND
