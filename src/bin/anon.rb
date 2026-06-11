def main(argv)
  case argv.shift
  when "bootstrap"
    pid = Process.spawn File.join(Anon.libexec, "anon-bootstrap"), *argv
    Process.waitpid2(pid)
  else Anon.usage!
  end
end
main(ARGV)
