alias k=kubectl
alias bb='kubectl run busybox --image=busybox:1.28 --rm -it --restart=Never --command --'
# JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-19.0.2.jdk/Contents/Home
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_361.jdk/Contents/Home
PATH=/Library/Java/JavaVirtualMachines/jdk-19.0.2.jdk/Contents/Home/bin:/Users/ARAJI/go/bin:/Users/ARAJI/go/bin:/usr/local/go/bin:/Users/ARAJI/Downloads/google-cloud-sdk/bin:/Users/ARAJI/.pyenv/shims:/Users/ARAJI/.pyenv/bin:/Users/ARAJI/.nvm/versions/node/v16.17.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/VMware:/Users/ARAJI/.krew/bin
export PATH


alias j12="export JAVA_HOME=`/usr/libexec/java_home -v 12`; java -version"
alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
alias j10="export JAVA_HOME=`/usr/libexec/java_home -v 10`; java -version"
alias j9="export JAVA_HOME=`/usr/libexec/java_home -v 9`; java -version"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias j7="export JAVA_HOME=`/usr/libexec/java_home -v 1.7`; java -version"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ARAJI/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

complete -C /opt/homebrew/bin/terraform terraform

complete -C /opt/homebrew/bin/mc mc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ARAJI/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ARAJI/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ARAJI/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ARAJI/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby
