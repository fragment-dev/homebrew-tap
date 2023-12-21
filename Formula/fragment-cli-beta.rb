require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4192.0.0-darwin-x64.tar.gz"
    sha256 "100c1feb441dd9b1f77169395a8770c17f0339805f0574e03cddb96585386d34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4192.0.0-darwin-arm64.tar.gz"
      sha256 "638350acde0df5a6bd5d4718dc08c9f856824c25813f4941cb7bdbbc729a938e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4192.0.0-linux-x64.tar.gz"
    sha256 "f62e7e29c61b7c622a4e6309552744734042e210286fcc0776862679c72ee1dc"
  end
  version "4192.0.0"
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
