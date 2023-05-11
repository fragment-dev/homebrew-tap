require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2637.0.0-darwin-x64.tar.gz"
    sha256 "4826759e3cef8da8ff09a0964f55329a56eb234111e113d9a50b0fbd657fc8a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2637.0.0-darwin-arm64.tar.gz"
      sha256 "fa20efac1f3078edcbb850cc29857899420d394ac9fbe47b324485692c9d360d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2637.0.0-linux-x64.tar.gz"
    sha256 "61971255cbccba482a269781f3240518aaac13d99b822faf322b73aa84419088"
  end
  version "2637.0.0"
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
