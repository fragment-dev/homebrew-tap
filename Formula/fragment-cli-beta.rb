require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3542.0.0-darwin-x64.tar.gz"
    sha256 "acc1ca10dec472c4e81483c98f5cd6e631141b1a8b0b135ad807824a741fd708"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3542.0.0-darwin-arm64.tar.gz"
      sha256 "823e3dd038200050fce731e44a5688bb33f36946095ee655b8fed12d1e3b6a20"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3542.0.0-linux-x64.tar.gz"
    sha256 "ed2ebf75d90459366110ef81520c40ec2f1ac6f2e3e20f44a977d72a2047c082"
  end
  version "3542.0.0"
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
