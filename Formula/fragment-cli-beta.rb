require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6027.0.0-darwin-x64.tar.gz"
    sha256 "352353d8026b0f5ddd07cb66a43d46dc6947491cc717a730c5ea8825b226a012"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6027.0.0-darwin-arm64.tar.gz"
      sha256 "21a0ceb1b8be599cf3a278701e06ee5bdc1b0e5afeb8abd04196644486eed92f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6027.0.0-linux-x64.tar.gz"
    sha256 "379797344963b78014d4a78b2363127e699edd5265a6a3c7ae931e7899a2bdbc"
  end
  version "6027.0.0"
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
