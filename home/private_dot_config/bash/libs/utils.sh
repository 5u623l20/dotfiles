#!/usr/bin/env bash
############################---Description---###################################
#                                                                              #
# Summary       : A collection of handy utilities and functions for bash       #
# Support       : destro.nnt@gmail.com                                         #
# Created date  : Mar 18,2017                                                  #
# Latest Modified date : Mar 18,2017                                           #
#                                                                              #
################################################################################

############################---Usage---#########################################

# source ~/path/to/directory/utils.sh

########################## Styled text output ##################################

################# Performing simple Yes/No confirmations #######################

# if is_confirmed; then
#   e_info_end "Here is a success message"
# else
#   e_die "You did not ask for a success message"
# fi

############ Testing if packages, apps, gems, etc. are installed ###############

# if type_exists 'git'; then
#   e_info_end "Git good to go"
# else
#   e_die "Git should be installed. It isn't. Aborting."
#   exit 1
# fi

# if is_os "darwin"; then
#   e_info_end "You are on a mac"
# else
#   e_die "You are not on a mac"
#   exit 1
# fi

##################### Sending notifications to Pushover ########################

# pushover "We just finished performing a lengthy task."

############################### Comparing A List ###############################

# recipes=(
#   A-random-package
#   bash
#   Another-random-package
#   git
# )
# list="$(to_install "${recipes[*]}" "$(brew list)")"
# if [[ "$list" ]]; then
# for item in ${list[@]}
#   do
#     echo "$item is not on the list"
#   done
# else
# fi


################################################################################

# Test whether the result of an 'ask' is a confirmation
#is_confirmed() {
#  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
#    return 0
#  fi
#  return 1
#}

#
# Test which OS the user runs
# $1 = OS to test
# Usage: if is_os 'darwin'; then
#
#is_os() {
#  if [[ "${OSTYPE}" == $1* ]]; then
#    return 0
#  fi
#  return 1
#}

#
# Pushover Notifications
# Usage: pushover "Title Goes Here" "Message Goes Here"
# Credit: http://ryonsherman.blogspot.com/2012/10/shell-script-to-send-pushover.html
#
#pushover () {
#  PUSHOVERURL="https://api.pushover.net/1/messages.json"
#  API_KEY=$PUSHOVER_API_KEY
#  USER_KEY=$PUSHOVER_USER_KEY
#  DEVICE=$PUSHOVER_DEVICE
#
#  TITLE="${1}"
#  MESSAGE="${2}"
#
#  curl \
#  -F "token=${API_KEY}" \
#  -F "user=${USER_KEY}" \
#  -F "device=${DEVICE}" \
#  -F "title=${TITLE}" \
#  -F "message=${MESSAGE}" \
#  "${PUSHOVERURL}" > /dev/null 2>&1
#}
