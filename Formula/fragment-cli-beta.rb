require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2999.0.0-darwin-x64.tar.gz"
    sha256 "ac7829e75d5157276b295446a3b76b9f705cd32f7ac03bb4cf4e79abb943939f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2999.0.0-darwin-arm64.tar.gz"
      sha256 "4354ad835808b9f163a61dca70384257498317ee6c68bbaecd5600faec45e830"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2999.0.0-linux-x64.tar.gz"
    sha256 "86f46d5af966db2b6247bc2aeacbf5fddce67ab66a695d9ff24e1f8bb1bc57c6"
  end
  version "2999.0.0"
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
