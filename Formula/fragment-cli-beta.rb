require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5723.0.0-darwin-x64.tar.gz"
    sha256 "0bf5b8f0c19841d3e0f1baed4c8d18a7cdf0064cff414a4ccfafa51bd40bf67c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5723.0.0-darwin-arm64.tar.gz"
      sha256 "f42c2bd74249d57adf483926fbb2b3f75491a1274fc58aa40b69ba7ed0b73a51"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5723.0.0-linux-x64.tar.gz"
    sha256 "d969b1c03a8c907f281d09fa5638c48f33024c92de8a7d1f05979008dfaf2faf"
  end
  version "5723.0.0"
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
