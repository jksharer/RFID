###
#Helper methods extracted from the main RFID module.
#

module RFID
  LIBNFC_SYSTEM_VERSION = "1.6.0-rc1"

  def self.fail_if_wrong_version
    if nfc_version !~ (Regexp.new(LIBNFC_SYSTEM_VERSION))
      raise LoadError,
       "Error connecting to the libnfc library
        Your system version of libnfc does not match!
        version: #{LIBNFC_SYSTEM_VERSION}"
    end
     
  end
end

