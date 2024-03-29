require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.29-darwin-x64.tar.gz"
    sha256 "1fd005209fa79226938ba07a917f7cc5d9df39496b6525cab47092acb40ec31e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.29-darwin-arm64.tar.gz"
      sha256 "69bc8d885ee3a30b6fdcc6bd2fb599412a5bae752a2a345a76a456237a76d57e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.29-linux-x64.tar.gz"
    sha256 "eaee8e2d195f74ac21f0074db29fa24c3ae9cf40600bfa427e93d89c45366223"
  end
  version "2024.3.29"
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
