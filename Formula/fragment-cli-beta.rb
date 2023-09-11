require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3527.0.0-darwin-x64.tar.gz"
    sha256 "6de52a6f6143e621c3c371360a5600ec5850dcc99d7d85c43c8c03a4d9e984f1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3527.0.0-darwin-arm64.tar.gz"
      sha256 "0895db1f8a70eda78e405259ad6c974235cccaaf07582bafb4a8d993376cb1c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3527.0.0-linux-x64.tar.gz"
    sha256 "d399efe907edafa809a32e2b0059499ed3a79c2a3125de6ccefe4b4af631aa46"
  end
  version "3527.0.0"
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
