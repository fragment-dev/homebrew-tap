require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3592.0.0-darwin-x64.tar.gz"
    sha256 "b04f56576774a4d79b1bbc329189d370922377b45c25850c81842d032640be1e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3592.0.0-darwin-arm64.tar.gz"
      sha256 "b8b52a6e74d857c19fd79a7c8b5aa7daf47318b29059996b4ad513387c2dc578"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3592.0.0-linux-x64.tar.gz"
    sha256 "2ac0f348cb843d5179704ab6f4f07cdf24cbdbd01efc673adb6fc80b2725f142"
  end
  version "3592.0.0"
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
