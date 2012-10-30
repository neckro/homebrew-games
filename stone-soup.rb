require 'formula'

class StoneSoup < Formula
  homepage 'http://crawl.develz.org/'
  url 'git://gitorious.org/crawl/crawl.git', :tag => '0.11.0'
  version '0.11.0'

  def caveats; <<-EOS.undent
    If you upgraded from 0.7.2, your saved games are not compatible with 0.11.
    Your 0.7.2 saved games are kept in:
      #{HOMEBREW_PREFIX}/Cellar/stone-soup/0.7.2/saves
    Version 0.11's save files are kept in:
      ~/Library/Application Support/Dungeon Crawl Stone Soup/saves
    To revert to the older version:
      brew switch stone-soup 0.7.2
    EOS
  end

  def install
    cd "crawl-ref/source" do
      # Crawl's build system checks the version number from the git repo, but
      # Homebrew only checks out the index so this fails
      # So, insert the version number manually instead of letting it check git
      inreplace "Makefile" do |s|
        s.sub!(/^\s+(SRC_VERSION *:= ).*$/, '\1'+version)
      end
      inreplace "util/gen_ver.pl" do |s|
        s.sub!(/(\$_ = ).*$/, '\1"'+version+'"; 1 ')
      end
      system "make", "prefix=#{prefix}", "DATADIR=data/", "install"
    end
  end
end
