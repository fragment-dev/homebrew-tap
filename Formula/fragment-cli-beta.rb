require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6062.0.0-darwin-x64.tar.gz"
    sha256 "bf3a1f882e9b96108f55c23b3c4d085597b76486aa9bb3db31a19d36b253a929"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6062.0.0-darwin-arm64.tar.gz"
      sha256 "1f1c3211254d70644079a177fe90e31eae2c7f222ceb306bbc1c3c6ac5b27a94"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6062.0.0-linux-x64.tar.gz"
    sha256 "67fc4056548d3c2f916ad016ff4b56b3dca5c43bdaf1e56c0677e236b751f354"
  end
  version "6062.0.0"
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
