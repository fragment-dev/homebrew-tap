require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3334.0.0-darwin-x64.tar.gz"
    sha256 "25e4e414a6bc9197ae04da99c389ea9661cdf2204059cb797059ff746ff07b40"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3334.0.0-darwin-arm64.tar.gz"
      sha256 "0bdf96928fd0e224967394840d2b4841c33affa87bc7a680f722d782df228879"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3334.0.0-linux-x64.tar.gz"
    sha256 "f9bd996addf73b8df4a622db1bf3b8a069b8a7ce1cb42a8d8eec313d6de72612"
  end
  version "3334.0.0"
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
