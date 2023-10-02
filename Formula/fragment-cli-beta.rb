require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3737.0.0-darwin-x64.tar.gz"
    sha256 "46b54261f5de69e975140152f4ad66ccd588fa6669b55c8be64b54569d26ca00"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3737.0.0-darwin-arm64.tar.gz"
      sha256 "3b6959ece9859e99e2cd900f4ad22c7f15d6d74cc23d2ce36176f71053a9e38d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3737.0.0-linux-x64.tar.gz"
    sha256 "50f1faa0e6f32203edfcb78e53070fefb44fa55241d356c7469341a0e27d8e67"
  end
  version "3737.0.0"
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
