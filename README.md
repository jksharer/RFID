# RFID

Summary: A Ruby wrapper for using the libnfc RFID library

##Introduction

RFID is a thin wrapper for Ruby that provides access to the
'libnfc' C library for use with RFID devices.  Please visit
'libnfc.org' for more information about the library and
its methods.

The wrapper is created using the 'FFI' library for Ruby.

#Introduction

## Installation

###Ruby
Add this line to your application's Gemfile:

    gem 'RFID'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install RFID

###System
The RFID gem requires a system shared library file to be
installed, called 'libnfc.so' (a Linux shared object file).
(TODO: Check that Windows users can use libnfc.dll)

The current version of RFID gem is built around the
'libnfc-1.0.6-rc1' release candidate available at
'http://libnfc.googlecode.com/files/libnfc-1.6.0-rc1.tar.gz'.

There are no package installers for this library yet, so it
must be manually installed

    >wget http://libnfc.googlecode.com/files/libnfc-1.6.0-rc1.tar.gz
    >cd libnfc-1.6.0-rc1
    >./configure
    >make
    >sudo make install

There are installation instruction available for creating/using
package installers, and well as Windows based system installs
available at: 'http://www.libnfc.org/documentation/installation'.

## Usage

#Documentation

As of July 2012, the online API documentation at 'http://www.libnfc.org/api/'
is only available for 'libnfc' version 1.4.1.  There are major structural
changes to the API with 1.6.0 that include replacement of the basic
setup method 'nfc_connect()' with 'nfc_init()'. (These changes broke
other Ruby wrappers around the API.)

To avoid confusion, I recommend downloading the documentation
for 1.6.0 yourself at:

http://libnfc.googlecode.com/files/libnfc-doc-1.6.0-rc1.zip
 

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
