require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5354.0.0-darwin-x64.tar.gz"
    sha256 "67e51ce8a65293f94de2828827c267629f0743cb0c82cc0d6a4e8197fe1725a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5354.0.0-darwin-arm64.tar.gz"
      sha256 "7cfc87207b70726bf359ca72991b35d030d4fc2da64b50182376cae7736d31c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5354.0.0-linux-x64.tar.gz"
    sha256 "10f6a48462ec54ec3ebcd7431cbff8797a701dd450bbefe7c40cb20f9c420ada"
  end
  version "5354.0.0"
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
