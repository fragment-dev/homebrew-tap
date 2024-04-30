require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4971.0.0-darwin-x64.tar.gz"
    sha256 "6f0bff2e8019bb1b5eac3f33c066c0f3217daa42fd691d9695d0e7a200a404d1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4971.0.0-darwin-arm64.tar.gz"
      sha256 "06a6daaddb23b5e82a0aa5a325e764f605c74f559b81f2371d9f5d64e23e450a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4971.0.0-linux-x64.tar.gz"
    sha256 "840b7a6dbe135e78c39a4072c29c4a44974e5eacb84da68493ce8ae4eb518780"
  end
  version "4971.0.0"
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
