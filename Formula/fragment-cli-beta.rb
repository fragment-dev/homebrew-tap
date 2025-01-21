require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6103.0.0-darwin-x64.tar.gz"
    sha256 "3692065d09b02405ae469003b68ded5c001b6c65298be678275c67229b9426e5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6103.0.0-darwin-arm64.tar.gz"
      sha256 "4e683ad949260ca4024c2701f0138ffe2d5869ebd5e97564e09d29b7c5f4e042"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6103.0.0-linux-x64.tar.gz"
    sha256 "c7e1e50f4d7cf166b90fa90b04ae5a448f479d6775177869330addcc22f984d7"
  end
  version "6103.0.0"
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
