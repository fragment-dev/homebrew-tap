require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3318.0.0-darwin-x64.tar.gz"
    sha256 "8e0861cc2f060b5aa7e7d4c50efba9257559cd930b801d13411ba0a8e93d6b37"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3318.0.0-darwin-arm64.tar.gz"
      sha256 "d1d1bf14cbdf9a569f66968d81809c522d0b5119bb559e8e6887ca74102bf3eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3318.0.0-linux-x64.tar.gz"
    sha256 "9c6bcaac035ccd85dc13cc93828fc4474c78f3c768a0bb44f541baddb870197f"
  end
  version "3318.0.0"
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
