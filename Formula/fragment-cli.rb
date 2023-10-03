require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.3-darwin-x64.tar.gz"
    sha256 "480fb3928e84dee0f9bfcf52a77683fcc02c389ef1b2497bc969254e889ede3d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.3-darwin-arm64.tar.gz"
      sha256 "ab8d01970903b595e298b39fbc86421f2ec216d53942bb345480539826cd774b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.3-linux-x64.tar.gz"
    sha256 "df0fad8f8e4a0e1e3e9d571390edf30c084260b7fdfc9463bc148a10378f4ab8"
  end
  version "2023.10.3"
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
