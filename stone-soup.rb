require 'formula'

class Crawl < Formula
  homepage 'http://crawl.develz.org/'
  url 'git://gitorious.org/crawl/crawl.git', :branch => 'stone_soup-0.11'
  version '0.11'

  def install
    cd "crawl-ref/source" do
      # Crawl's build system checks the version number from the git repo, but
      # Homebrew only checks out the index so this fails
      inreplace "Makefile" do |s|
        s.sub!(/^(SRC_VERSION *:= ).*$/, '\1'+version)
      end
      inreplace "util/gen_ver.pl" do |s|
        s.sub!(/(\$_ = ).*$/, '\1'+version)
      end
      system "make", "prefix=#{prefix}", "SAVEDIR=saves/", "DATADIR=data/", "install"
    end
  end
end
