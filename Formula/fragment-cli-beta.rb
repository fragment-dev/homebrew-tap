require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5939.0.0-darwin-x64.tar.gz"
    sha256 "164b6ca0799a11f17e2026730b99d04b1aac1adab87006145e101ccf5f157c64"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5939.0.0-darwin-arm64.tar.gz"
      sha256 "0019e85e7f1abfec7ce01a6e5bdb8e671addf9e4675b53cefdd75552abb1bcbe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5939.0.0-linux-x64.tar.gz"
    sha256 "89fa100ba318531d90e54baf17dc793cb795a444dc17271bf1ac7a1014675f02"
  end
  version "5939.0.0"
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
