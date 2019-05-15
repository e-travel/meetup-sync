require 'logger'

class Log
  @@log ||= Logger.new(STDOUT)

  class << self
    def debug(msg)
      return if test?
      @@log.debug(msg)
    end

    def info(msg)
      return if test?
      @@log.info(msg)
    end

    def warn(msg)
      return if test?
      @@log.warn(msg)
    end

    def error(msg)
      return if test?
      @@log.error(msg)
    end

    def fatal(msg)
      return if test?
      @@log.fatal(msg)
    end

    def test?
      ENV['APP_ENV'] == 'test'
    end
  end
end
