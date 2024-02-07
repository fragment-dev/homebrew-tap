require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4510.0.0-darwin-x64.tar.gz"
    sha256 "2e1ac28f57aed1a633ea010d4e8c86cc74d58889341045d75becfd29a9907d89"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4510.0.0-darwin-arm64.tar.gz"
      sha256 "49c9afb302739eb6faafc4e1c9cff375d72b87bafd8a2a3c3c5fecc670ddad8e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4510.0.0-linux-x64.tar.gz"
    sha256 "8171ccd93f556e0e49f7c4ba6b9d8e730f080f6860551ac6e6103603bf190bc7"
  end
  version "4510.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
