source ~/.bashrc

export JAVA_HOME=$(/usr/libexec/java_home)

export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/julianfleischer/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/julianfleischer/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/julianfleischer/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/julianfleischer/Downloads/google-cloud-sdk/completion.bash.inc'; fi
