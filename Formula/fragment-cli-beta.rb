require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2520.0.0-darwin-x64.tar.gz"
    sha256 "3141f4015416e2e6d3b2d7b1232b15116bab886dcf8594677021d881553476b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2520.0.0-darwin-arm64.tar.gz"
      sha256 "7b5106ca99c1d129648b459bfb76ea045a7aa1cc9dc084cee959b786e2178ab3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2520.0.0-linux-x64.tar.gz"
    sha256 "b5929a4e73cd00d3e668cfc398e0f73f4365b96fe291f06eb91f1c97a9768979"
  end
  version "2520.0.0"
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
