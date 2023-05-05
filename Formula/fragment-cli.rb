require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.4-1-darwin-x64.tar.gz"
    sha256 "50fe9cdb78f02626a477208dc076f1dff1a54b6b50741b569ec67c17e96c075e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.4-1-darwin-arm64.tar.gz"
      sha256 "278e159d416a8dcbbc5acb9028a78c0f52d384a9dd9abed022b6e0889d452f48"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.4-1-linux-x64.tar.gz"
    sha256 "606d2470006af0a92d95db39d949a7099528157ba3aceadff1f0c9346e2076c1"
  end
  version "2023.5.4-1"
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
