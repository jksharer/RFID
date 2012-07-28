require "RFID/version"
require "RFID/helpers"
require "ffi"

###
#The RFID module uses 'ffi' library to make a Ruby rapper around the
#C language system shared library 'libnfc' available at 'libnfc.org'.
#
#All C methods are reproduced at the Ruby level and are available at 
#the class level after the file is required in your codebase.
#For example, to call the library version method from Ruby: RFID.nfc_version.
#

module RFID
  extend FFI::Library
  ffi_lib "libnfc"  

  ###
  #Version checking before wrapping the rest of the library to prevent
  #name method matching errors.
  attach_function :nfc_version, [], :string

  #Fail if wrong version returned and go no further
  fail_if_wrong_version

  ###
  #Library initialization and exit.  The nflib library itself must be
  #started up (and later shut down) prior to accessing any of the following
  #methods.
  #
  #Input to these methods is optional in C, and may be used too attach
  #the output to a different context.
  #attach_function :nfc_init, [ :pointer ], :void
  #attach_function :nfc_exit, [ :pointer ], :void

  ###
  #Error reporting methods.
  #attach_function :nfc_perror, [ :pointer, :string], :void
end
