require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5933.0.0-darwin-x64.tar.gz"
    sha256 "6ea188bb9b40f5731a2bc556bf7a1a89a69c2d9bfc70785a9ae00efa2814eb07"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5933.0.0-darwin-arm64.tar.gz"
      sha256 "452dbe358f6f5c9ff4de9ad2483e0de9e920bc55e2ec041a71c68a66d9a6bdce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5933.0.0-linux-x64.tar.gz"
    sha256 "772a1c46131a052cb359b81e94c2663b890e175c25b924589eab265f6dd8f7c8"
  end
  version "5933.0.0"
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
