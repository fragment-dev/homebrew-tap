require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2936.0.0-darwin-x64.tar.gz"
    sha256 "b9ec50b435cc5c620d21e0e2d53aa211b795039f5b1b1d0a263cd30e513b13fd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2936.0.0-darwin-arm64.tar.gz"
      sha256 "dc6fd976be6c42b0e6c08ca95144df2f83bc54771360bf3b6c7cbcaf30ee04c6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2936.0.0-linux-x64.tar.gz"
    sha256 "198adacada934432ca4d9ce078834e3ee6081f7178fef58a2e9a067d5acc5c37"
  end
  version "2936.0.0"
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
