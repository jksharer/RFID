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
  #Library initialization and exit.  The nfclib library itself must be
  #started up (and later shut down) prior to accessing any of the following
  #methods.
  #
  #NOTE:As far as I can tell, the methods in this library that require 
  #passing in a nfc_context* pointer are not utilized. They are simply
  #typecast to void and not utilized.  I have a suspicion that they 
  #are in place for multithreading in later revisions, but frankly don't
  #know.
  #
  #From a design standpoint, I am going to continue to include them in
  #the wrapper, to keep the API interface from breaking later.  This means
  #passing in a lot of nils from Ruby in those spots.  TODO: extract out
  attach_function :nfc_init, [ :pointer ], :void       #RFID.nfc_init(nil)
  attach_function :nfc_exit, [ :pointer ], :void       #RFID.nfc_exit(nil)

  ###
  #Error reporting methods.
  #attach_function :nfc_perror, [ :pointer, :string], :void
end
