require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2642.0.0-darwin-x64.tar.gz"
    sha256 "3ddba4aa139a7abb9fe15289540d09762e5caa00e814b9a8eb801b48a8d960d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2642.0.0-darwin-arm64.tar.gz"
      sha256 "801774fc73690c04c6561366c40828311930ea44a5dbbb3462a2e681a39416fa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2642.0.0-linux-x64.tar.gz"
    sha256 "fbe2ceb9cdd12122e684a58fab87a427e37c8180544d61a7d1838fb04a057b36"
  end
  version "2642.0.0"
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
