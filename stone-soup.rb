require 'formula'

class StoneSoup < Formula
  homepage 'http://crawl.develz.org/'
  url 'http://sourceforge.net/projects/crawl-ref/files/Stone%20Soup/0.11.0/stone_soup-0.11.0.tar.xz'
  sha1 '5a4674b0ee032040d49c5f23a2f215b957b06440'

  depends_on 'xz' => :build

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
    cd "source" do
      system "make", "prefix=#{prefix}", "DATADIR=data/", "install"
    end
  end
end
