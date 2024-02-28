require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4650.0.0-darwin-x64.tar.gz"
    sha256 "e2406cfc47dd93d0c3695325a9b7063aed338c258b5600e9f36422ef2c6b5340"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4650.0.0-darwin-arm64.tar.gz"
      sha256 "bf865fe70f70904bfca08f5fa1d1fd07e915e60e5f3bcc2bea93b5ce1d0a7245"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4650.0.0-linux-x64.tar.gz"
    sha256 "f88f8c1c915c6155f294d92820b502d1e40e1f92a3c7c9f00670ffc1c32b824a"
  end
  version "4650.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
