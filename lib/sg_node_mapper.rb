# Core
require 'singleton'

# Gems
require 'execjs'
require 'active_support/core_ext'

# Internal
require 'sg_node_mapper/version'

# Simple wrapper for the sgNodeMapper javascript library. Uses
# [ExecJS](https://github.com/sstephenson/execjs) to dynamically select the best
# available javascript platform to execute the code on.
#
# This class will dynamically call methods in the sgNodeMapper javascript
# library. In the case that the the method doesn't exist, it will return nil,
# rather than raising a NoMethodError, this is a side effect of blindly
# delegating to javascript.
class SgNodeMapper
  include Singleton

  # When a method is called on this class, we intercept it and pass it through
  # to the javascript context by converting the method name from underscore_case
  # to camelCase, then calling that method on the javascript context with the
  # given *args.
  #
  # method - The Symbol name of the method being called.
  # args - The Array of arguments (optional).
  #
  # Returns the result from javascript.
  def self.method_missing(method, *args)
    instance.context.call("nodemapper.#{method.to_s.camelize(:lower)}", *args)
  end

  # Get a (potentially cached) version of the compiled source code for sgNodeMapper.
  #
  # Returns an ExecJS::ExternalRuntime::Context.
  def context
    @context ||= ExecJS.compile(source)
  end

  private

  # Get a string of the sgNodeMapper source code.
  #
  # Returns the String javascript source code.
  def source
    File.read(source_path)
  end

  # Get the full path to the sgNodeMapper.js source code.
  #
  # Returns the String path to sgNodeMapper.
  def source_path
    File.join(File.expand_path('../../', __FILE__), 'vendor', 'sg_node_mapper', 'nodemapper.js')
  end
end
