require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.14-darwin-x64.tar.gz"
    sha256 "86da46198348e4c767d3903340454d0298f491feece0708b1ca4ebc290441e30"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.14-darwin-arm64.tar.gz"
      sha256 "17ca3af544f214e9e6f365bfc9b47412a26213ced7f2465757e354aa6850c59d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.14-linux-x64.tar.gz"
    sha256 "9b99e9c7c87ef414c31a112878aa973400843d1c34ceb0671c0a14fd2e3d3a0d"
  end
  version "2023.12.14"
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
