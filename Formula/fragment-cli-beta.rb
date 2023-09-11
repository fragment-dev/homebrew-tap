require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3523.0.0-darwin-x64.tar.gz"
    sha256 "24712945be5387fa90488989103e12239175f496427e86b8609cf6a39dc6b337"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3523.0.0-darwin-arm64.tar.gz"
      sha256 "63f1594aa95f211fd0fd450b01f3e2ce93ecf03f2b0bff4a92e4ca620c33ca1e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3523.0.0-linux-x64.tar.gz"
    sha256 "17bb57ae3fab5bef8e30f95beeb3c483b799389bac67ecc90d21619fa449cb0b"
  end
  version "3523.0.0"
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
