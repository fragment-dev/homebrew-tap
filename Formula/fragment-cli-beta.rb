require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2233.0.0-darwin-x64.tar.gz"
    sha256 "bf6dca913627ffa8bdf6f10ce63d1240807f47b830b7f2427936179b5d961368"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2233.0.0-darwin-arm64.tar.gz"
      sha256 "d6878e54c7606bcad89580951290034876f1a6ddabadc8fe807b2bfd78e75b11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2233.0.0-linux-x64.tar.gz"
    sha256 "dff7f1054c899f5346ae653878793e73d644c4432ecaa44e4b4a883a54954bd3"
  end
  version "2233.0.0"
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
