require "RFID/version"
require "ffi"

module RFID
  extend FFI::Library
  ffi_lib "libnfc"  

  ###
  #Version checking before wrapping the rest of the library to prevent
  #name method matching errors.
  LIBNFC_SYSTEM_VERSION = "1.6.0-rc1"
  attach_function :nfc_version, [], :string

  #Fail if wrong version returned and go no further
  if nfc_version !~ (Regexp.new(LIBNFC_SYSTEM_VERSION))
    raise LoadError, 
      "Error connecting to the libnfc library
      Your system version of libnfc does not match!
      Requires version: #{LIBNFC_SYSTEM_VERSION}"
  end


end
