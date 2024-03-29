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
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export M2_HOME=/home/sajith/tools/apache-maven-3.6.3

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

#export SOURCE_ROOT=~/work
export GOROOT=/usr/lib/go
#export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/scratch/go


export GOROOT=/usr/lib/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=/snap/bin:$PATH
export PATH=$PATH:/home/sajith/tools/scala-2.12.8/bin

export PATH=/home/sajith/Dropbox/todo.txt_cli-2.10:$JAVA_HOME/bin:$M2_HOME/bin:$TEXTTEST_INSTALL_DIR/bin:/home/sajith/tools/sbt-1.3.13/bin:/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8

#sonar settings
export SONAR_SCANNER_HOME=~/apps/sonar/sonar-scanner-3.2.0
export PATH=$PATH:$SONAR_SCANNER_HOME/bin


export SPARK_HOME=/home/sajith/apps/spark-2.3.1-bin-hadoop2.7/

source /home/sajith/scratch/myconfigs/bashscripts/wo_autocomplete
source /home/sajith/scratch/myconfigs/bashscripts/kp_autocomplete
#source /home/sajith/Dropbox/todo.txt_cli-2.10/todo_completion

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

#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#source /usr/local/bin/virtualenvwrapper.sh
#export CASSANDRA_HOME=/home/sajith/tools/elassandra-6.2.3.12/

complete -cf sudo
#unset PROMPT_COMMAND

export DOCKER_REGISTRY=eu.gcr.io/pagero-build
export DOCKER_HOST=tcp://172.17.42.1:2375
export VISUAL=vim
export TERM=xterm-color
source /etc/profile.d/vte.sh
export GITHUB_TOKEN="db841f87b83ad94d5691a27988fb163fac21ebf3"

source /home/sajith/scratch/oh-my-git/prompt.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sajith/.sdkman"
[[ -s "/home/sajith/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sajith/.sdkman/bin/sdkman-init.sh"
