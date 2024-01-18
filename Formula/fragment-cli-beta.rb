require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4369.0.0-darwin-x64.tar.gz"
    sha256 "860721169a55599fa52f93ecefe1514158932ab1b918f259de9984390b9d767d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4369.0.0-darwin-arm64.tar.gz"
      sha256 "ecbcca9ccc1a3ab8b216c1f4997f491ab37ac0cecb03f35b4f5e7dc6145151c2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4369.0.0-linux-x64.tar.gz"
    sha256 "e2eb9b9f1368f74671be59dca7196a8a46497e9943eefd1ff8c1c3c6e176a92d"
  end
  version "4369.0.0"
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
