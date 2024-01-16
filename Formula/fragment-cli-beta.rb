require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4340.0.0-darwin-x64.tar.gz"
    sha256 "9a7475d49ea6d72d7f2da588602316e614d10546bbf45462cb35b24330ab7ef0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4340.0.0-darwin-arm64.tar.gz"
      sha256 "05a6daa3374f2b5a1c90de381fdec165c1e7b0d0f671b1636e36ac33f301065a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4340.0.0-linux-x64.tar.gz"
    sha256 "62806a79dc70f36ff909bfe49f27ec45c6c1f6193c9d592264e86772d13c2d0d"
  end
  version "4340.0.0"
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
