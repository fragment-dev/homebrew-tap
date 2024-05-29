require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5135.0.0-darwin-x64.tar.gz"
    sha256 "38ecd12d0d94208b4549793b476603aa185ce8e58748981184f9448915743ffc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5135.0.0-darwin-arm64.tar.gz"
      sha256 "b3b043f9681744d3741f364cc18bf649664245bc9a3474a7eda23fa04dce038e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5135.0.0-linux-x64.tar.gz"
    sha256 "6ef62454d0e50872ded7ffbcb32c3a24bc88c075f6a625ec7ec9b523db923c3a"
  end
  version "5135.0.0"
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
