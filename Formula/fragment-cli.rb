require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.11-darwin-x64.tar.gz"
    sha256 "59328a9cad39ff31ec45cde62982991da6a9f43b245a25296370a2b83dada336"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.11-darwin-arm64.tar.gz"
      sha256 "cdf53ec11a1bf881c1aca173f7bd766c01c409ee511f30784471f9f78980c94b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.11-linux-x64.tar.gz"
    sha256 "4b0b8c377e903744c72fe09bfcfb2d019b06d29900ed5607e08b9eee9dde8d36"
  end
  version "2023.5.11"
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
