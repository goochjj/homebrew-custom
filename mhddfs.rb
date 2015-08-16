require "formula"

class Mhddfs < Formula
  homepage "https://romanrm.net/mhddfs"
  url "http://mhddfs.uvw.ru/downloads/mhddfs_0.1.39.tar.gz"
  sha256 "702fc5486460c1828898426b1935179ce60bc1ed16fc8bc575c9ec1d12acef91"

  depends_on "pkg-config" => :build
  depends_on :osxfuse

  resource "uthash" do
    url "https://github.com/troydhanson/uthash/archive/master.zip"
    sha256 "b18772bfbb780ff793453291e9242f383b3e6f3a23a8bd9e2d40fedf72660883"
  end

  def install
    inreplace "src/main.c" do |s|
      s.gsub! /^\#include.*sys\/vfs.*/, "/* sys/vfs */"
    end
    inreplace "Makefile" do |s|
      s.gsub! /-MMD/, "-Iuthash -MMD"
    end
    resource("uthash").stage { system "mkdir #{buildpath}/uthash"; system "cp src/*.h #{buildpath}/uthash/" }
    (lib/"pkgconfig").mkpath
    system "make WITHOUT_XATTR=1"
    system "mkdir -p #{prefix}/bin #{man}/man1"
    system "install -s -m 0755 mhddfs #{prefix}/bin/mhddfs"
    system "install -m 0644 mhddfs.1 #{man}/man1/mhddfs.1"
  end
end
