require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5795.0.0-darwin-x64.tar.gz"
    sha256 "adfc4f0648ff868fda0457f6eb021ed968c3858c1cb8c3c996f2c37bb941b403"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5795.0.0-darwin-arm64.tar.gz"
      sha256 "93e18945ab7656f088bb6384a3a76b0c9bbaec389b3ea30556da55720fb5b261"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5795.0.0-linux-x64.tar.gz"
    sha256 "165f8393415b21bac44cb2a7f479d92be984012042ae4b590bec783da4aa1b71"
  end
  version "5795.0.0"
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
