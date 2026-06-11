module Anon
  module Commands
    ##
    # @param [String] src
    # @param [String] dest
    # @return [Command]
    def cp(src, dest)
      Command
        .new("cp")
        .argv(src, dest)
    end

    ##
    # @param [String] masterpw
    # @return [Command]
    def pwd_mkdb(masterpw)
      Command
        .new("pwd_mkdb")
        .argv("-p")
        .argv("-d", File.dirname(masterpw))
        .argv(masterpw)
    end

    ##
    # @param [String] path
    # @return [Command]
    def mkdir_p(path)
      Command
        .new("mkdir")
        .argv("-p", path)
    end
  end
end