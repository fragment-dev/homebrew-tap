require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4805.0.0-darwin-x64.tar.gz"
    sha256 "bf3275da95aa4effe8f1fd6163ddaeced44c2dd8703d557e74b8ed3af6e3392d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4805.0.0-darwin-arm64.tar.gz"
      sha256 "b1410b22d43d72ee48c746f0e9b7174e244c4a178c7d8b4dc740e045cf3a6b76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4805.0.0-linux-x64.tar.gz"
    sha256 "c6090bf086bfca69e1778694bd58b68e350ed925d9435594eecef6390abd30c7"
  end
  version "4805.0.0"
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
