require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4193.0.0-darwin-x64.tar.gz"
    sha256 "2cf95aef9122e154a6a6cacaf70fb7314776fd012f6d73e95a7499ad1673beff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4193.0.0-darwin-arm64.tar.gz"
      sha256 "4f3a88add5c2b62567222ac661b99145e9d982e422fcbe0ac3b77b5ffcd753b6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4193.0.0-linux-x64.tar.gz"
    sha256 "4f8d6986aee2758ef0bf7a4b2b02fe331697cdc3cfc5d8375c9a2eefc2696c10"
  end
  version "4193.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
