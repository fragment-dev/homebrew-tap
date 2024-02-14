require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4561.0.0-darwin-x64.tar.gz"
    sha256 "e0d2b7c591a945b33d62131c792b365c7a30bb4143ee59baed219d3635f44e91"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4561.0.0-darwin-arm64.tar.gz"
      sha256 "4ece466905a31f6bf2edb016ce1591d45799847415cc8d29d34f35ee2777192c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4561.0.0-linux-x64.tar.gz"
    sha256 "358e9b4caaefdcc51a036529f30e61f12562edaa0285b0c214dd6c4cbf88c9cd"
  end
  version "4561.0.0"
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
