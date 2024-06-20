require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5304.0.0-darwin-x64.tar.gz"
    sha256 "dc6d3094b821d710351e849be5d97508352053430f20c39f2675da1b3fbf6cc3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5304.0.0-darwin-arm64.tar.gz"
      sha256 "903345201c9434724cf79e2d2b4b04c8bb46dca445c4823da22d7e7bb5120539"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5304.0.0-linux-x64.tar.gz"
    sha256 "a47dff815fc0b754af65d50a6c9f148c8fc2139e73d6743b1d55b9a644fae396"
  end
  version "5304.0.0"
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
