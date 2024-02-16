require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4575.0.0-darwin-x64.tar.gz"
    sha256 "f3474b60a1595e0330a004b9d315a212af709ad7d765cc8bc790086bfc6f09c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4575.0.0-darwin-arm64.tar.gz"
      sha256 "f523778f4bb23e0e9bcfe466ae28a7e5c4891b2619bd20d93f50780d12759792"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4575.0.0-linux-x64.tar.gz"
    sha256 "a78ddcc213f08d9790854401a097ab251c6c0e531d8a32c8a969c86a6fe98166"
  end
  version "4575.0.0"
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
