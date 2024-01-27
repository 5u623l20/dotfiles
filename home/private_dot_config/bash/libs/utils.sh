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
