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
export JAVA_HOME=/usr/java/jdk1.8.0_05
export M2_HOME=/home/sajith/apps/apache-maven-3.2.2
export JBOSS4_HOME=/home/sajith/apps/jboss-4.2.1GA

#WORK ON
export WORK_DIR=/home/sajith/work

#NOTES
export NOTE_PATH=/home/sajith/Dropbox/Documents/gnote

#TEXT_TEST
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

#Disable CAPS
/usr/bin/setxkbmap -option 'ctrl:nocaps'

#SPELL CHECKER
shopt -s cdspell
fortune -a | cowsay
