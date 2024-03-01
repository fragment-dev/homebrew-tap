require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4682.0.0-darwin-x64.tar.gz"
    sha256 "53b7d47eef4616898d6073583f39fe5c18ca44d98ff8c52c5bdbc592e2d500ba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4682.0.0-darwin-arm64.tar.gz"
      sha256 "98b6424dd0b364d838aeea3d7bbd31339255ecfc6bf465de4558757104780b88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4682.0.0-linux-x64.tar.gz"
    sha256 "7206855898c369b871f6a31f8c3b63ad692a27033a989a312e8a0e9d3798dfc1"
  end
  version "4682.0.0"
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
