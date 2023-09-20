require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3632.0.0-darwin-x64.tar.gz"
    sha256 "14891996695379b5f919734ab13a44e73619aeb5bfaa1ccf5d6eaf8100e11b38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3632.0.0-darwin-arm64.tar.gz"
      sha256 "539c1234130a54189322bd6354f6ae1f3333a7f33dc058fa44f21cdafaca734e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3632.0.0-linux-x64.tar.gz"
    sha256 "5110ac3209e296ea9cc746008dccc7298d7ebe8016c69bec67087418de5451ca"
  end
  version "3632.0.0"
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
