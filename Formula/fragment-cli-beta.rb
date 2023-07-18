require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3117.0.0-darwin-x64.tar.gz"
    sha256 "c1ade373f9ab4d2b3510c9aa88ddfe801c8505921626cd12de1af0539ff491f4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3117.0.0-darwin-arm64.tar.gz"
      sha256 "b9acbe2ba5fe14cef1301fd6763c4429fbed7ae0b557b7b01f95386666bada4c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3117.0.0-linux-x64.tar.gz"
    sha256 "e269b2369f9b516f1f15defd547cef6271e20c0b1e638837ae70b1ec8369f080"
  end
  version "3117.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
