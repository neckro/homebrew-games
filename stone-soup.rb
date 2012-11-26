require 'formula'

class StoneSoup < Formula
  homepage 'http://crawl.develz.org/'
  url 'http://sourceforge.net/projects/crawl-ref/files/Stone%20Soup/0.11.0/stone_soup-0.11.0.tar.xz'
  sha1 '5a4674b0ee032040d49c5f23a2f215b957b06440'

  depends_on 'xz' => :build

  def install
    cd "source" do
      system "make", "prefix=#{prefix}", "DATADIR=data/", "install"
    end
  end
end
