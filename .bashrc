# .bashrc

# ource global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Functions
source /home/sajith/scratch/myconfigs/bashscripts/my_functions


#Alias
source /home/sajith/scratch/myconfigs/bashscripts/my_aliases

#Variables
export JAVA_HOME=/home/sajith/apps/jdk1.8.0_74
export M2_HOME=/home/sajith/tools/apache-maven-3.3.9
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
export GOROOT=/home/sajith/tools/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/scratch
export PATH=/home/sajith/Dropbox/todo.txt_cli-2.10:$JAVA_HOME/bin:$M2_HOME/bin:$TEXTTEST_INSTALL_DIR/bin:/home/sajith/tools/sbt/latest/bin:$PATH

export SPARK_HOME=/home/sajith/tools/spark-2.1.1-bin-hadoop2.7

source /home/sajith/scratch/oh-my-git/prompt.sh
source /home/sajith/scratch/myconfigs/bashscripts/wo_autocomplete
source /home/sajith/scratch/myconfigs/bashscripts/kp_autocomplete
source /home/sajith/Dropbox/todo.txt_cli-2.10/todo_completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


complete -F wo_options wo
complete -F kp_options kp
complete -F mm_options mm 

#Disable CAPS
#/usr/bin/setxkbmap -option 'ctrl:nocaps'

complete -cf sudo
#unset PROMPT_COMMAND
