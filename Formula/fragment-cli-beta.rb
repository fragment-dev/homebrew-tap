require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5404.0.0-darwin-x64.tar.gz"
    sha256 "8919650e98e06e9263ddddce8068d8ebe046f58484f67fd774bb1be006875f87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5404.0.0-darwin-arm64.tar.gz"
      sha256 "600606ecd269f5e217d4e333c9b8820e341720cd44a98ebf4b7c228e663f67ac"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5404.0.0-linux-x64.tar.gz"
    sha256 "181ec434ae11c7edcc2ce50b4ef3f50fd4a0025fa4ee9eaddee5ddd669618d44"
  end
  version "5404.0.0"
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
