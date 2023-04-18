require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2460.0.0-darwin-x64.tar.gz"
    sha256 "6cd38695ef34ba5def310fd62a53bb47e9b36fc6f9fe8ed65827e019839b09e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2460.0.0-darwin-arm64.tar.gz"
      sha256 "593273543c3400a8271934c4a85991fb1d048fd5e715b2d0f55a4767117d9060"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2460.0.0-linux-x64.tar.gz"
    sha256 "9a0b085168503cb8c6a9154a8a19d88efa3453b8c0c9b8fe0028de0edcb7c6e8"
  end
  version "2460.0.0"
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
